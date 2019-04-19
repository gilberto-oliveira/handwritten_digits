% Forward propagation
%
function [mlp] = nn_forward(mlp, X)
  L = length(mlp);
  for l = 1:L
    if eq(l, 1) A = X; else A = mlp(l - 1).A; endif
    mlp(l).Z = (mlp(l).W * A) + mlp(l).b;
    mlp(l).A = ifelse(eq(l, L), nn_softmax(mlp(l).Z), nn_relu(mlp(l).Z));
  endfor
endfunction