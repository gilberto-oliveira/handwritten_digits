% Compute score from Dataset
%
function [score, y_pred] = nn_score(mlp, X, y)
  [~, y_pred] = nn_predict(mlp, X);
  n           = length(y);
  score       = sum((y_pred == y) / n) * 100;
endfunction