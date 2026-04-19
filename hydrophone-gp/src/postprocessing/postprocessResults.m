function Res = postprocessResults(Data, ymean, ParamNorm, Param)

if size(ymean, 2) == 2
    % nsigma = 2; % currently output \pm 1, 2 \sigma
    ystd  = sqrt(ymean(:, 2));
    ymean = ymean(:, 1);
    yplus1simga   = (ymean + 1*ystd) * ParamNorm.sy + ParamNorm.cy;
    yplus2sigma   = (ymean + 2*ystd) * ParamNorm.sy + ParamNorm.cy;
    yminus1sigma  = (ymean - 1*ystd) * ParamNorm.sy + ParamNorm.cy;
    yminus2sigma  = (ymean - 2*ystd) * ParamNorm.sy + ParamNorm.cy;
    ymean   = ymean * ParamNorm.sy + ParamNorm.cy;
    if ~Param.isprediction
        yactual = Data.ytest * ParamNorm.sy + ParamNorm.cy;
    end

    if Param.logy
        yplus1simga  = exp(yplus1simga)*Param.coefLog;
        yplus2sigma  = exp(yplus2sigma)*Param.coefLog;
        yminus1sigma = exp(yminus1sigma)*Param.coefLog;
        yminus2sigma = exp(yminus2sigma)*Param.coefLog;
        ymean        = exp(ymean)*Param.coefLog;
        if ~Param.isprediction
            yactual = exp(yactual)*Param.coefLog;
        end
    end
    if ~Param.isprediction
        figure;
        z = 1:length(ymean);
        f = [yplus2sigma; flip(yminus2sigma,1)]; 
        fill([z'; flip(z, 2)'], f,...
            'k', ...
            LineStyle = "none",...
            FaceAlpha = 0.3);
        hold on; 
        plot(z, ymean, 'k', LineWidth=1)
        plot(z, yactual, 'r', LineWidth=1)
        legend('{\pm}2\sigma', 'mean', 'actual')
    end
    
elseif size(ymean, 2) == 1
    % plot(mexp_pred, 'k')
    % hold on
    % plot(mexp_psigma, 'r')
    % plot(mexp_msigma, 'r')
    % plot(C.Qs, 'b', 'LineWidth',2)
end

Res.yplus1simga  = yplus1simga ; 
Res.yplus2sigma  = yplus2sigma ;
Res.yminus1sigma = yminus1sigma;
Res.yminus2sigma = yminus2sigma;
Res.ymean        = ymean       ; 
if ~Param.isprediction
    Res.yactual = yactual;
end

end