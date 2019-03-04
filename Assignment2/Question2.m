
% Author: Noah Rondeau
% ECE 485: Data Analysis and Pattern Recognition
% Assignment 2
% Question 2
clc;
clear all;

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
    
    x1 = (mu(1)-10):0.01:(mu(1)+10);
    x2 = (mu(2)-10):0.01:(mu(2)+10);
    [X1, X2] = meshgrid(x1,x2);
    
    fprintf('Data set %i: mean = [5, 5]^T, N = 1000, rho = %d\n\n', i,rho(i));
    %calculate covariance matrix
    SIGMA1 = Q2_CovFrom(sigma1, sigma2, rho(i));
    %generate random data from distribution
    Data1 = Q2_RandomGenerate(N, mu, SIGMA1);
    %calculate PDF at points within the x,y domain
    PDF1 = mvnpdf([X1(:) X2(:)], mu', SIGMA1);
    PDF1 = reshape(PDF1, size(X1));
    % calculate the value of the 1, 2, nd 3 sigma levels using mvnpdf
    % just use points at (x1 = mu(1) + n*sigma, x2 = mu(2))
    % all points of the same contour height will satisfy the ellipsoids
    one_sigma       = [(mu(1) +   sigma1), mu(2)];
    two_sigma       = [(mu(1) + 2*sigma1), mu(2)];
    three_sigma     = [(mu(1) + 3*sigma1), mu(2)];
    levels = sort(mvnpdf([one_sigma;two_sigma;three_sigma], mu', SIGMA1));
    
    % get eigenvectors and values of the covariance matrix
    [V1, D1] = eig(SIGMA1);
    % these are vectors centered at origin
    % convert them to lines through mu
    slope1 = V1(2,1)/V1(1,1);
    slope2 = V1(2,2)/V1(1,2);
    eigenline1 = slope1*(x1 - mu(1)) + mu(2);
    eigenline2 = slope2*(x1 - mu(1)) + mu(2);
    
    figure(i);
    scatter(Data1(:,1), Data1(:,2), '+');
    hold on;
    contour(X1,X2,PDF1, levels, '-r');
    hold on;
    line(x1, eigenline1, 'Color', 'g');
    hold on;
    line(x1, eigenline2, 'Color', 'g');
    hold on;
    t = sprintf('Data-Set %d: mu = [5, 5]^T, N = 1000, rho = %f', i, rho(i));
    title(t);
    xlabel('x_1');
    ylabel('x_2');
    ax = gca;
    ax.XLim = [x1(1) x1(end)];
    ax.YLim = [x2(1) x2(end)];
    axis equal;
    grid on;
    hold off;
end