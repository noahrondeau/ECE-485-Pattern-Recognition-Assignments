
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

fprintf('PART A: estimated class means and covariances\n');
fprintf('Class 1:\n');
disp('Mean:');
disp(mu1);
disp('Covariance:');
disp(Sigma1);
fprintf('Class 2:\n');
disp('Mean:');
disp(mu2);
disp('Covariance:');
disp(Sigma2);
fprintf('Class 3:\n');
disp('Mean:');
disp(mu3);
disp('Covariance:');
disp(Sigma3);

fprintf('\nPART B: Test point classification by Mahalanobis distance\n');

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
    fprintf('x_%d Mahalanobis Distances:\n', i);
    fprintf('From:\n\tClass1: %f\n\tClass2: %f\n\tClass3: %f\n', dist1(i), dist2(i), dist3(i));
    min_dist = min([dist1(i), dist2(i), dist3(i)]);
    if min_dist == dist1(i)
        x_class(i) = 1;
    elseif min_dist == dist2(i)
        x_class(i) = 2;
    elseif min_dist == dist3(i)
        x_class(i) = 3;
    end
    fprintf('Point belongs to: Class%d\n\n', x_class(i));
end

% Tag each x with its class value and label
X = [X x_class'];
for i=1:4
    data_labels(i,1) = cellstr(sprintf('x%d, (C%d)', i, X(i,3)));
end



fprintf('PART D: Supervised vs Unsupersised Learning\n');
fprintf('If we did not know which points belonged to which class, the approach above does not work.\n');
fprintf('It becomes a clustering problem, not a classification problem.\n');
fprintf('We have not yet gone over these issues in class.\n');
fprintf('But, I could imagine a sort of finite-element analysis which would\n');
fprintf('assign a density to a region based on the number of data points it contains.\n');
fprintf('Assuming either:\n\ta) that I know the number of classes the data represents, or\n');
fprintf('\tb) that I assume they are distributed according to a particular distribution:\n');
fprintf('I would then attempt to fit distributions centered at the density peaks (assuming they exist).\n');
fprintf('This would not generally work if two classes overlapped significantly\n\n');

figure(1);
hold on;
scatter(class1(:,1), class1(:,2), '+b');
scatter(class2(:,1), class2(:,2), 'om');
scatter(class3(:,1), class3(:,2), 'xy');
scatter(X(:,1), X(:,2), '^k');
text(X(:,1) + 0.5, X(:,2) + 0.2, data_labels);
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
title('Class 1,2,3 Data with 1,2,3-\sigma contours, eigenvectors, and decision boundaries');
xlabel('x_1');
ylabel('x_2');
legend('Class1', 'Class2', 'Class3', 'Location', 'best');
axis equal;
grid on;
hold off;
        
