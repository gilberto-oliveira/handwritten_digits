% PCA principal component analysis
%
function [z] = nn_pca(X, k, var=.99)
  [~, n]    = size(X);
  M         = (X * X') / n;
  [U, S, V] = svd(M);
  U_reducer = U(:, 1:k);
  z         = U_reducer' * X;
  S_diag    = diag(S);
  S_kvar    = sum(S_diag(1:k)) / sum(S_diag)
  if (S_kvar >= var)
    disp(['PCA with variance: ' num2str(var) ' success!']);
  endif
endfunction