% Test results
%
clc;
clear all;
close all;

RADAM1HL50     = csvread('RADAM1HL50_900E_L1e-3R1e-4.csv');
RADAM1HL150    = csvread('RADAM1HL150_400E_L1e-3R1e-4.csv');
RADAM1HL300    = csvread('RADAM1HL300_400E_L1e-3R3e-1.csv');
RADAM2HL784800 = csvread('RADAM2HL784800_400E_L1e-3R1e-4.csv');
TADAM1HL300    = csvread('TADAM1HL300_600E_L1e-3R1e-4.csv');

RSGDM1HL150    = csvread('RSGDM1HL150_2000E_L2e-1R1e-4.csv');
RSGDM1HL300    = csvread('RSGDM1HL300_2000E_L2e-1R1e-4.csv');
RSGDM2HL100200 = csvread('RSGDM2HL100200_2000E_L1e-3R1e-4.csv');
RSGDM2HL784800 = csvread('RSGDM2HL784800_2000E_L2e-1R1e-4.csv');
TSGDM1HL100    = csvread('TSGDM1HL100_2000E_L4e-1R1e-4.csv');

# use gnuplot toolkit
graphics_toolkit('gnuplot');

# ADAM group
figure(1);

t = 1:length(RADAM1HL50) - 1;
plot(t, RADAM1HL50(t, 2), '-k', 'linewidth', 2);
hold on;

t = 1:length(RADAM1HL150) - 1;
plot(t, RADAM1HL150(t, 2), '-r', 'linewidth', 2);
hold on;

t = 1:length(RADAM1HL300) - 1;
plot(t, RADAM1HL300(t, 2), '-b', 'linewidth', 2);
hold on;

t = 1:length(RADAM2HL784800) - 1;
plot(t, RADAM2HL784800(t, 2), '-g', 'linewidth', 2);
hold on;

t = 1:length(TADAM1HL300) - 1;
plot(t, TADAM1HL300(t, 2), '-c', 'linewidth', 2);
hold on;

grid minor;

legend('RADAM1HL50\_900E\_L1e-3R1e-4', ...
       'RADAM1HL150\_400E\_L1e-3R1e-4', ...
       'RADAM1HL300\_400E\_L1e-3R3e-1', ...
       'RADAM2HL784800\_400E\_L1e-3R1e-4', ...
       'TADAM1HL300\_600E\_L1e-3R1e-4');
title('Loss by Epoch');
xlabel('Epoch (per fifity)');
ylabel('Loss');
ylim([0 1.5]);
       
# SGD group
figure(2);

t = 1:length(RSGDM1HL150) - 1;
plot(t, RSGDM1HL150(t, 2), '-k', 'linewidth', 2);
hold on;

t = 1:length(RSGDM1HL300) - 1;
plot(t, RSGDM1HL300(t, 2), '-r', 'linewidth', 2);
hold on;

t = 1:length(RSGDM2HL100200) - 1;
plot(t, RSGDM2HL100200(t, 2), '-b', 'linewidth', 2);
hold on;

t = 1:length(RSGDM2HL784800) - 1;
plot(t, RSGDM2HL784800(t, 2), '-g', 'linewidth', 2);
hold on;

t = 1:length(TSGDM1HL100) - 1;
plot(t, TSGDM1HL100(t, 2), '-c', 'linewidth', 2);
hold on;

grid minor;

legend('RSGDM1HL150\_2000E\_L2e-1R1e-4', ...
       'RSGDM1HL300\_2000E\_L2e-1R1e-4', ...
       'RSGDM2HL100200\_2000E\_L2e-1R1e-4', ...
       'RSGDM2HL784800\_2000E\_L2e-1R1e-4', ...
       'TSGDM1HL100\_2000E\_L4e-1R1e-4');
title('Loss by Epoch');
xlabel('Epoch (per fifity)');
ylabel('Loss');
ylim([0 .6]);
       
# SGD vs ADAM
figure(3);

t = 1:length(RADAM2HL784800) - 1;
plot(t, RADAM2HL784800(t, 2), '-r', 'linewidth', 2);
hold on;

t = 1:length(RSGDM2HL784800) - 1;
plot(t, RSGDM2HL784800(t, 2), '-b', 'linewidth', 2);
hold on;

grid minor;

legend('RADAM2HL784800\_400E\_L1e', ...
       'RSGDM2HL784800\_2000E\_L2e-1R1e-4');
title('Loss by Epoch');
xlabel('Epoch (per fifity)');
ylabel('Loss');
ylim([0 .6]);