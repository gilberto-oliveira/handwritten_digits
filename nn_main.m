% Handwritten Digit Recognition
%
clc;
close all;
clear all;

# load datasets
[X_train, y_train, X_test, y_test, num_labels] = nn_load_datasets();

y_train_hot = nn_encode_labels(y_train, num_labels);

[m, n] = size(X_train);

mlp = nn_mlpnw([m 500 500 num_labels]);

learning_rate = .001;
num_epochs = 400;
lambda = .0001;

costs = [];

st = time();

for epoch = 1:num_epochs
  mlp  = nn_forward(mlp, X_train);
  cost = nn_ccost(mlp, y_train_hot, lambda);
  mlp  = nn_backward(mlp, X_train, y_train_hot, learning_rate, lambda);
  if (~mod(epoch, 50) || eq(epoch, 1))
    disp(['iteration ' num2str(epoch) ', cost ' num2str(cost)]);
    fflush(stdout);
    costs = [costs cost];
  endif
endfor

dt = time() - st;
printf('\nTrain time: %fs - %fmin\n', dt, (dt / 60));

score_tn = nn_score(mlp, X_train, y_train);
[score_tt, y_pred] = nn_score(mlp, X_test, y_test);
printf('\nScores:\n\ttrain = %f %%\n\ttest  = %f %%\n', score_tn, score_tt);

nn_plot_mislabeled_images(X_test, y_test, y_pred, 12);

#nn_plot_filters(mlp);

figure(3);
plot(costs, '-r', 'linewidth', 2);
legend('Loss curve');
title('Loss by Epoch');
xlabel('Epoch (per fifity)');
ylabel('Loss');

# save costs
#csvwrite('RADAM1HL50_900E_L1e-3R1e-4.csv', [squeeze(1:9)' squeeze(costs)']);
#csvwrite('RADAM1HL150_400E_L1e-3R1e-4.csv', [squeeze(1:9)' squeeze(costs)']);
#csvwrite('RADAM1HL300_400E_L1e-3R3e-1.csv', [squeeze(1:9)' squeeze(costs)']);
#csvwrite('RADAM2HL784800_400E_L1e-3R1e-4.csv', [squeeze(1:9)' squeeze(costs)']);
#csvwrite('TADAM1HL300_600E_L1e-3R1e-4.csv', [squeeze(1:13)' squeeze(costs)']);

#csvwrite('RSGDM1HL150_2000E_L2e-1R1e-4.csv', [squeeze(1:41)' squeeze(costs)']);
#csvwrite('RSGDM1HL300_2000E_L2e-1R1e-4.csv', [squeeze(1:41)' squeeze(costs)']);
#csvwrite('RSGDM2HL100200_2000E_L1e-3R1e-4.csv', [squeeze(1:41)' squeeze(costs)']);
#csvwrite('RSGDM2HL784800_2000E_L2e-1R1e-4.csv', [squeeze(1:41)' squeeze(costs)']);
#csvwrite('TSGDM1HL100_2000E_L4e-1R1e-4.csv', [squeeze(1:41)' squeeze(costs)']);