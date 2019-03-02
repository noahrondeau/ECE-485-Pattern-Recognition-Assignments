function SIGMA = Q2_CovFrom(sigma1, sigma2, rho)
%Q2_CovFrom()
%   Creates a 2x2 covariance matrix for bivariate normal distribution based
%   on the x1 and x2 standard deviations and the correlation coefficient

sigma12 = sigma1*sigma2*rho;
SIGMA = [(sigma1^2) sigma12; sigma12 (sigma2^2)]; 

end

