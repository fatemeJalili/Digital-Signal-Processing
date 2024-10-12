clear; close all; clc;
%% DSP - Final Project %%%%%%%%%%%%%%%%%%%%%%
load('BVD.mat')
fsample = data.fsample;
signal = data.signal;

%% PART B
subplot(2,1,1)
plot(signal)
title('signal of echoes')

diameter1 = diameterCalc(signal, fsample);

disp(['The estimated blood vessel diameter using Noiseless signal is ',...
    num2str(diameter1),' meters or ' ,num2str(1000 * diameter1), ' millimeters']);


noisySignal = awgn(signal, 20);
subplot(2,1,2)
plot(noisySignal)
title('noisy signal of echoes')

diameter2 = diameterCalc(noisySignal, fsample);

disp(['The estimated blood vessel diameter using noisy signal is ',...
    num2str(diameter2),' meters or ' ,num2str(1000 * diameter2), ' millimeters']);