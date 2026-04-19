function ypred = gpfit(Data, Param, hyp, newX)

[covfunc, ~] = gpCovDefinition(Param);
meanfunc = [];
inference = @infGaussLik;
likfunc = @likGauss;
% prediction
[m, s2] = gp(hyp, inference, meanfunc, covfunc, likfunc,...
                Data.Xtrain, Data.ytrain, newX);
ypred = [m, s2]; 

end