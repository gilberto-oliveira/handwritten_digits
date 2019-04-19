% Load datasets
%
function [X_train, y_train, X_test, y_test, n_lbls] = nn_load_datasets()
  # load dataset
  dataset   = open('datasets/ti3dataset.mat');
  shuffle   = randperm(length(dataset.y));
  dataset.X = dataset.X(:, shuffle);
  dataset.y = dataset.y(shuffle);
  # train dataset
  X_train   = dataset.X(:, 1:3500);
  y_train   = dataset.y(1:3500);
  # test dataset
  X_test    = dataset.X(:, 3501:end);
  y_test    = dataset.y(3501:end);
  n_lbls    = 10;
endfunction