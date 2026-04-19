function h = gpval(Data, Param)

if Param.seedGP ~= 'r'; rng(Param.seedGP); end
[covfunc, hyp] = gpCovDefinition(Param);
meanfunc = [];
inference = @infGaussLik;
likfunc = @likGauss;

% hyp.mean
hyp.mean = [];

% hyp.lik
hyp.lik = ones(1, eval(likfunc())) .* randn();


% Optimization
[h, ~] = minimize(hyp, @gp, -Param.maxIters, ...
                          inference, meanfunc, covfunc, likfunc,...
                          Data.Xtrain, Data.ytrain); 

end