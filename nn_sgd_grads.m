% Compute gradients function
%
function [grads] = nn_sgd_grads(mlp, X, y, lambda)
  L     = length(mlp);
  n     = length(y);
  grads = [];
  # output layer
  grads(L).dZ = mlp(L).A - y;
  grads(L).dW = (grads(L).dZ * mlp(L - 1).A') / n + (mlp(L).W * lambda) / n;
  grads(L).dB = sum(grads(L).dZ, 2) / n;
  # hidden layers
  for l = L - 1:-1:1
    if eq(l, 1) A = X; else A = mlp(l - 1).A; endif
    grads(l).dZ = (mlp(l + 1).W' * grads(l + 1).dZ) .* nn_relu(mlp(l).Z, true);
    grads(l).dW = (grads(l).dZ * A') / n  + (mlp(l).W * lambda) / n;
    grads(l).dB = sum(grads(l).dZ, 2) / n;
  endfor
endfunction