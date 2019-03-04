function Q2_PlotEigen(mu, Sigma, scale)
%Q2_PlotEigen plots eigenvectors of covariance matrix centered on mean
[V, D] = eig(Sigma);
V = V*sqrt(D)*scale;
quiver(mu(1), mu(2), V(1,1), V(2,1), 'LineWidth', 2, 'Color', 'g');
quiver(mu(1), mu(2), V(1,2), V(2,2), 'LineWidth', 2, 'Color', 'g');
end

