function Q2_PlotEllipse(mu, Sigma, scale, visibility)
%Q2_PlotEllipses Plot a contour ellipse at scale*stdev centered on mean
%   mu: mean
%   Sigma: covariance
%   scale: how many standard deviations
%   visibility: whether in plot legend or not, 'on' or 'off'

t = linspace(0, 2*pi, 1000);
[Eigvec, Eigval] = eig(Sigma);
V = Eigvec*sqrt(Eigval)*scale;
e = V*[cos(t); sin(t)] + mu;
plot(e(1,:), e(2,:), '-r', 'LineWidth', 1, 'HandleVisibility', visibility);
end

