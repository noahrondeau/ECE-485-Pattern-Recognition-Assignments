
clear all;
clc;

mu = [0,0]; %// data
sigma = [.5 0; 0 .5]; %// data
x = -5:.1:5; %// x axis
y = -4:.1:4; %// y axis

[X Y] = meshgrid(x,y); %// all combinations of x, y
Z = mvnpdf([X(:) Y(:)],mu,sigma); %// compute Gaussian pdf
Z = reshape(Z,size(X)); %// put into same size as X, Y
contour(X,Y,Z), axis equal  %// contour plot; set same scale for x and y...