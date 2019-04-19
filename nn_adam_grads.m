function [grads] = nn_adam_grads(mlp, X, y, lambda, beta_1=.9, beta_2=.999, epsilon=1e-08)
  L     = length(mlp);
  grads = nn_sgd_grads(mlp, X, y, lambda);
  t = 0;
  for l = L:-1:1
    g  = grads(l).dW;
    m  = zeros(size(g));
    v  = zeros(size(g));
    t += 1;
    m  = beta_1 * m + (1 - beta_1) * g;
    v  = beta_2 * v + (1 - beta_2) * g .^ 2;
    m_corrected = m / (1 - (beta_1 .^  t));
    v_corrected = v / (1 - (beta_2 .^  t));
    grads(l).dW = m_corrected ./ (sqrt(v_corrected) + epsilon);
  endfor
endfunction