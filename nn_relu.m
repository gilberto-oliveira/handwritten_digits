% RELU activation function
%
function [A] = nn_relu(Z, derivative=false)
    A = ifelse(derivative, Z > 0, max(0, Z));
endfunction