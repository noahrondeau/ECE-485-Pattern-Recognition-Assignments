function bound = error_bound_normal(mu1, Sigma1, pw1, mu2, Sigma2, pw2, beta)
%error_bound_normal Calculate gaussian d-dimensional error bound as a
%   function of beta (0 <= beta <= 1)
%   param: mu1, mu2: column vectors of means
%   param: Sigma1, Sigma2: covariance matrices
%   param: pw1, pw2: a priori class probabilities
%   beta:   beta value in bound formula

covar_sum = beta*Sigma1 + (1-beta)*Sigma2;

%term 1
mu_diff = (mu2 - mu1);
scale = beta*(1-beta)/2;
term1 = scale*mu_diff'*inv(covar_sum)*mu_diff;

%term 2
term2 = 0.5*log( det(covar_sum) / ((det(Sigma1)^beta)*(det(Sigma2)^(1-beta))) );

k = term1 + term2;

bound = sqrt(pw1, pw2)*exp(-k);
end

