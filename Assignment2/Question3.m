
% Author: Noah Rondeau
% ECE 485: Data Analysis and Pattern Recognition
% Assignment 2
% Question 2
clc;
clear all;
close all;

fprintf('ECE 485: Data Analysis and Pattern Recognition\n');
fprintf('Author: Noah Rondeau\n');
fprintf('Assignment 2, Question 3\n\n');

%load data and extract into classes
load Data/Data3;
class1 = Data3( Data3(:,3)==1, 1:2);
class2 = Data3( Data3(:,3)==2, 1:2);
class3 = Data3( Data3(:,3)==3, 1:2);

mu1 = mean(class1)';
Sigma1 = cov(class1);
mu2 = mean(class2)';
Sigma2 = cov(class2);
mu3 = mean(class3)';
Sigma3 = cov(class3);

x1 = [10,2];
x2 = [-3,4];
x3 = [2,2];
x4 = [5, -7];
X = [x1;x2;x3;x4];

% determine mahalanobis distance for each x relative to each class
dist1 = mahal(X, class1);
dist2 = mahal(X, class2);
dist3 = mahal(X, class3);

% determine class for each x
for i=1:4
    min_dist = min([dist1(i), dist2(i), dist3(i)]);
    if min_dist == dist1(i)
        x_class(i) = 1;
    elseif min_dist == dist2(i)
        x_class(i) = 2;
    elseif min_dist == dist3(i)
        x_class(i) = 3;
    end
end

% Tag each x with its class value
X = [X x_class'];

figure(1);
hold on;
scatter(class1(:,1), class1(:,2), '+b');
scatter(class2(:,1), class2(:,2), 'om');
scatter(class3(:,1), class3(:,2), 'xk');
Q2_PlotEllipse(mu1, Sigma1, 1);
Q2_PlotEllipse(mu1, Sigma1, 2);
Q2_PlotEllipse(mu1, Sigma1, 3);
Q2_PlotEllipse(mu2, Sigma2, 1);
Q2_PlotEllipse(mu2, Sigma2, 2);
Q2_PlotEllipse(mu2, Sigma2, 3);
Q2_PlotEllipse(mu3, Sigma3, 1);
Q2_PlotEllipse(mu3, Sigma3, 2);
Q2_PlotEllipse(mu3, Sigma3, 3);
Q2_PlotEigen(mu1, Sigma1, 1);
Q2_PlotEigen(mu2, Sigma2, 1);
Q2_PlotEigen(mu3, Sigma3, 1);
axis equal;
grid on;
hold off;
        
