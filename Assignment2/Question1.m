
% Author: Noah Rondeau
% ECE 485: Data Analysis and Pattern Recognition
% Assignment 2
% Question 1
clc;
clear all;

fprintf('ECE 485: Data Analysis and Pattern Recognition\n');
fprintf('Author: Noah Rondeau\n');
fprintf('Assignment 2, Question 1\n\n');

% Load data from files into column vectors
load Data/Data1;
load Data/Data2;

Data1 = Data1';
Data2 = Data2';

% ========= PART A and B ==========

% calculate best fit gaussians
x1 = -2:0.01:14;
x2 = -1:0.01:7;
Data1_dist = fitdist(Data1, 'Normal');
Data2_dist = fitdist(Data2, 'Normal');
pdf1 = pdf(Data1_dist, x1);
pdf2 = pdf(Data2_dist, x2);

% print message
fprintf('PART A and B: plot histograms with best fit gaussian\n\n');

% Plot Histograms for each data set
figure(1);
histogram(Data1,'Normalization', 'pdf');
line(x1, pdf1, 'Color', 'red', 'Linewidth', 2);
title('Normalized Histogram and Best Fit Normal Dist of Data1');
xlabel('x');
ylabel('Probability Density');
figure(2);
histogram(Data2, 'Normalization', 'pdf');
line(x2, pdf2, 'Color', 'red', 'Linewidth', 2);
title('Normalized Histogram and Best Fit Normal Dist of Data2');
xlabel('x');
ylabel('Probability Density');

% PART C: Chi-square testing
fprintf('PART C: Chi-square testing\n\n');
% default is 5% confidence level
[h1, p1] = chi2gof(Data1);
[h2, p2] = chi2gof(Data2);

fprintf('Chi-square results for Data1:\n');
fprintf('h = %d, p = %f\n', h1, p1);
fprintf('Chi-square results for Data2:\n');
fprintf('h = %d, p = %f\n', h2, p2);

fprintf('\nChi-square test does not reject null hypothesis for Data1 at alpha = 0.05.\n');
fprintf('Chi-square test rejects null hypothesis for Data2 at alpha = 0.05.\n');

% PART D

fprintf('\nPART D: Re-test Data 2 with exponential distribution');
fprintf('Based on the shape of the distribution, try again with an exponential distribution\n');

Data2_dist2 = fitdist(Data2, 'Exponential');
pdf3 = pdf(Data2_dist2, x2);
[h3, p3] = chi2gof(Data2, 'CDF', Data2_dist2);

figure(3);
histogram(Data2, 'Normalization', 'pdf');
line(x2, pdf3, 'Color', 'red', 'Linewidth', 2);
title('Normalized Histogram of Data2 with best-fit exponential distribution');
xlabel('x');
ylabel('Probability Density');


fprintf('Chi-square results for Data2 with an Exponential Dist:\n');
fprintf('h = %d, p = %f\n', h3, p3);
fprintf('Since h = 0, the null hypothesis is not rejected\n\n');





