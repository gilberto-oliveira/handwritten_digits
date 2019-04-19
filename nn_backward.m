% Backward propagation function
%
function [mlp] = nn_backward(mlp, X, y, learning_rate=1e-3, lambda)
  L     = length(mlp);
  # compute grads
  grads = nn_adam_grads(mlp, X, y, lambda);
  #grads = nn_sgd_grads(mlp, X, y, lambda);
  # update MLP parameters
  for l = 1:L
    mlp(l).W -= learning_rate * grads(l).dW;
    mlp(l).b -= learning_rate * grads(l).dB;
  endfor
endfunction