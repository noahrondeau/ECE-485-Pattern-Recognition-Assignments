function bound = bhattacharyya_normal(mu1, Sigma1, p_w1, mu2, Sigma2, p_w2)
% mu1, mu2: column vectors
% Sigma1, Sigma2: covariance matrices
% p_w1, p_w2: a priori probabilities

sum_sig = 0.5*(Sigma1+Sigma2);
mu_diff = mu2-mu1;
term1 = (1/8)*(mu_diff')*inv(sum_sig)*mu_diff;
term2 = 0.5*log(det(sum_sig)/(sqrt(det(Sigma1)*det(Sigma2))));
bound = sqrt(p_w1*p_w2)*exp(-(term1+term2));

% bound = error_bound_normal(mu1, Sigma1, p_w1, mu2, Sigma2, p_w2, 0.5);
end

