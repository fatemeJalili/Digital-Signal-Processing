clear; close all; clc;
%% DSP - Final Project %%%%%%%%%%%%%%%%%%%%%%

%% PART E
lenna = imread('Lenna.png');
figure
imshow(lenna)

lenna = rgb2gray(lenna);

Q5func(10, lenna);
Q5func(20, lenna);
Q5func(30, lenna);
Q5func(50, lenna);
