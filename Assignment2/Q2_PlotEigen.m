function Q2_PlotEigen(mu, Sigma, scale, vis_1, vis_2)
%Q2_PlotEigen plots eigenvectors of covariance matrix centered on mean
%   mu : mean, Sigma: covariance, scale: how many sigmas
%   vis_1, vis_2: display in plot legend or not: either 'on' or 'off'
[V, D] = eig(Sigma);
V = V*sqrt(D)*scale;
quiver(mu(1), mu(2), V(1,1), V(2,1), 'LineWidth', 2, 'Color', 'g', 'HandleVisibility', vis_1);
quiver(mu(1), mu(2), V(1,2), V(2,2), 'LineWidth', 2, 'Color', 'g', 'HandleVisibility', vis_2);
end

