function nn_plot_filters(mlp)
  n = size(mlp(end).A, 1);
  A = mlp(1).W;
  id = randi([1 size(A, 1)], [1 n]);
  figure(2);
  for i = 1:n
    subplot(2, n / 2, i);
    imshow(reshape(A(id(i), :), 20, 20), 'colormap', gray);
    title(sprintf('1º HL\nFilter %d', id(i)));
  endfor
endfunction