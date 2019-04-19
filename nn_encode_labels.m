function [one_hot] = nn_encode_labels(y, num_labels)
  num_cls = length(y);
  one_hot = zeros(num_labels, num_cls);
  for i = 1:num_cls
    one_hot(y(i), i) = 1;
  endfor
endfunction