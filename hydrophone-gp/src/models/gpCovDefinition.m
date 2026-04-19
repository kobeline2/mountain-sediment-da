function [covfunc, hyp] = gpCovDefinition(Param)

if Param.seedGP ~= 'r'; rng(Param.seedGP); end
l = @() randn();
v = @() randn();

% % 1
% cov1 = {@covSum, {@covLINiso, @covSEiso}};
% cov4 = {@covSum, {@covLINiso, @covSEard}};
% covfunc = {@covSum, {cov1, cov4}};
% hyp.cov = [l(), l(), v(),...
%            l(), l(), l(), l(), l(), l(), l(), l(), l(), l(), l(), l()];

% % 2
% covfunc = {@covProd, {@covLINiso, @covSEiso}};
% hyp.cov = [l(), l(), l()];

% 3
covfunc = {@covProd, {@covLINiso, @covSEard}};
hyp.cov = randn(1, Param.D+2);

% % 4
% covfunc = {@covProd, {{@covProd, {@covLINiso, @covLINiso}}, @covSEard}};
% hyp.cov = randn(1, Param.D+3);

% % 5
% cov = {@covProd, {@covLINiso, @covSEard}};
% covfunc = {@covProd, {cov, @covLINiso}};
% hyp.cov = randn(1, Param.D+3);


end