function outputPredictionExcel(Res, Param)


% ヘッダー（フィールド名）の取得
headers = fieldnames(Res);

% データの抽出と整理
data = [];
for i = 1:length(headers)
    fieldData = Res.(headers{i});
    data = [data, fieldData]; % 列ベクトルとして追加
end

% ヘッダーとデータの結合
outputData = [headers'; num2cell(data)];

% Excelファイルへの書き込み
writecell(outputData, Param.outputExcelPath);

end