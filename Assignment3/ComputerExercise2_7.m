% Author: Noah Rondeau
% ECE 485: Data Analysis and Pattern Recognition
% Assignment 3
% Question: Computer Exercise 2.7

clear all;
close all;
clc;

%data parameters
mu1 = -0.5;
mu2 = 0.5;
sigma1 = 1;
sigma2 = 1;
pw1 = 0.5;
pw2 = 0.5;

%PARTA: function bhattacharya defined elsewhere
fprintf('PARTA: ------------------------------------------------------\n');
bound = bhattacharyya_normal(mu1, sigma1, pw1, mu2, sigma2, pw2);
fprintf('Bhattacharyya bound on w1 and w2: %f\n', bound);

%PARTB:
fprintf('PARTB: ------------------------------------------------------\n');
fprintf('See attached page\n');

%PARTC AND PARTD


N = 100:100:1000;
error = []; % empty to store empirical error

for i=N
   
end




