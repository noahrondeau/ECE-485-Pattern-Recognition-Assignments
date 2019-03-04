
% Author: Noah Rondeau
% ECE 485: Data Analysis and Pattern Recognition
% Assignment 2
% Question 2
clc;
clear all;
close all;

fprintf('ECE 485: Data Analysis and Pattern Recognition\n');
fprintf('Author: Noah Rondeau\n');
fprintf('Assignment 2, Question 2\n\n');

fprintf('PART A: Generate 3 data sets\n');
fprintf('PART B: Plot the data sets as scatter plots\n');
fprintf('PART C: Overlay eigenvectors of each data set and 1-, 2-, and 3-sigma contours\n');
fprintf('For this question, each of A, B, and C will be done on one set of data at a time\n\n');

mu = [5 5]';
sigma1 = 2;
sigma2 = 1;
N = 1000;
rho = [-0.8 0.2 0.9];

for i=1:3
    
    fprintf('Data set %i: mean = [5, 5]^T, N = 1000, rho = %d\n\n', i,rho(i));
    %calculate covariance matrix
    Sigma = Q2_CovFrom(sigma1, sigma2, rho(i));
    %generate random data from distribution
    Data1 = Q2_RandomGenerate(N, mu, Sigma);
    
    figure(i);
    hold on;
    scatter(Data1(:,1), Data1(:,2), '+');
    Q2_PlotEllipse(mu, Sigma, 1);
    Q2_PlotEllipse(mu, Sigma, 2);
    Q2_PlotEllipse(mu, Sigma, 3);
    Q2_PlotEigen(mu, Sigma, 1);
    t = sprintf('Data-Set %d: mu = [5, 5]^T, N = 1000, rho = %f', i, rho(i));
    title(t);
    xlabel('x_1');
    ylabel('x_2');
    axis equal;
    grid on;
    hold off;
end