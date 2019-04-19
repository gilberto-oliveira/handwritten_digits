% Predict function (fitting)
%
function [probs, y] = nn_predict(mlp, X)
  mlp    = nn_forward(mlp, X);
  probs  = mlp(end).A;
  [~, y] = max(probs);
endfunction