% Hyperbolic tangent activation function
% if derivative then Z = tanh(Z)
%
function [A] = nn_tanh(Z, derivative=false)
  A = ifelse (derivative, 1 - Z .^ 2, tanh(Z));
endfunction