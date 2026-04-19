function [] = evaluateModel(ypred, ytest)
    scatter(ypred, ytest, MarkerEdgeAlpha=0.2); hold on; 
    xlabel('predicted')
    ylabel('actual')
    maxVal = max(max(ytest), max(ypred));
    minVal = min(min(ytest), min(ypred));
    xlim([minVal, maxVal])
    ylim([minVal, maxVal])
    plot([minVal, maxVal], [minVal, maxVal], 'k--'); % 黒の破線で45度線を描く
    axis square
    hold off;
end