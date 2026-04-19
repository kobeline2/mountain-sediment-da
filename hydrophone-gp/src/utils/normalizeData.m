function [Data, ParamNorm] = normalizeData(Data, Param, ParamNorm)

if nargin == 2
    [Data.Xtrain, ParamNorm.cX, ParamNorm.sX] =...
        normalize(Data.Xtrain, Param.normMethod);
    [Data.ytrain, ParamNorm.cy, ParamNorm.sy] =...
        normalize(Data.ytrain, Param.normMethod);
    Data.Xtest = (Data.Xtest - ParamNorm.cX) ./ ParamNorm.sX;
    Data.ytest = (Data.ytest - ParamNorm.cy) ./ ParamNorm.sy;
else
    Data.X = (Data.X - ParamNorm.cX) ./ ParamNorm.sX;
end

end