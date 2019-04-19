% Cross-entropy cost function
%
function [cost] = nn_ccost(mlp, y, lambda)
  n       = length(y);
  L       = length(mlp);
  cost    = -sum(sum(y .* log(mlp(end).A))) / n;
  sW_norm = 0;
  for l = 1:L sW_norm += norm(mlp(l).W); endfor
  cost += (lambda * sW_norm) / (2 * n);
endfunction