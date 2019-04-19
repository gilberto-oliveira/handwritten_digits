function nn_plot_mislabeled_images(X, y, p, n=5)
  id_imgs = randi(length(y), [1 n]);
  figure(1);
  for i = 1:n
    subplot(3, n / 3, i);
    next_img = id_imgs(i);
    imshow(reshape(X(:, next_img), 20, 20));
    title(sprintf('Prediction %d\nClass %d', p(next_img), y(next_img)));
    hold on;
  endfor
endfunction