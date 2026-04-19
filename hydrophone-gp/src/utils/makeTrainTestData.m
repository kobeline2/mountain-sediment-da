function Data = makeTrainTestData(Data, Param)

if Param.seedPartition ~= 'r'; rng(Param.seedPartition); end

% データの合計数
N = size(Data.X, 1);

% 分割を行う
cv = cvpartition(N, 'HoldOut', Param.pPartition);

% 訓練データとテストデータにインデックスを適用
Data.Xtrain = Data.X(training(cv), :);
Data.ytrain = Data.y(training(cv), :);

Data.Xtest = Data.X(test(cv), :);
Data.ytest = Data.y(test(cv), :);

end