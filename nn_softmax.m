% Softmax function
% if derivative=true then Z=softmax(Z)
%
function [A] = nn_softmax(Z, derivative=false)
  if (derivative)
    A = Z .* (1 - Z);
  else
    Z   -= max(Z);
    exps = exp(Z);
    A    = exps ./ sum(exps);
  endif
endfunction