% Build a MLP struct
%
function [mlp] = nn_mlpnw(layer_dims)
  L = length(layer_dims);
  mlp = [];
  for i = 2:L, l = i - 1;
    mlp(l).W  = randn(layer_dims(i), layer_dims(l)) / sqrt(layer_dims(l));
    mlp(l).b  = zeros(layer_dims(i), 1);
    # cache from forward and backward
    mlp(l).A  = [];
    mlp(l).Z  = [];
  endfor
endfunction
