function Q2_PlotEllipse(mu, Sigma, scale)
%Q2_PlotEllipses Plot a contour ellipse at scale*stdev centered on mean

t = linspace(0, 2*pi, 1000);
[Eigvec, Eigval] = eig(Sigma);
V = Eigvec*sqrt(Eigval)*scale;
e = V*[cos(t); sin(t)] + mu;
plot(e(1,:), e(2,:), '-r', 'LineWidth', 1);
end

