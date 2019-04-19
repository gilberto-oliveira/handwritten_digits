% Logistic activation function
% if derivative then Z = sigmoid(Z)
%
function [A] = nn_sigmoid(Z, derivative=false)
  A = ifelse (derivative, Z .* (1 - Z), 1 ./ (1 + exp(-Z)));
endfunction