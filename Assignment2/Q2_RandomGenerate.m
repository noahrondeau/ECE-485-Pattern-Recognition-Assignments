function dataout = Q2_RandomGenerate(N, mu, sigma)
%UNTITLED Generates N random numbers from multivariate dist
%   This is really just a wrapper function around mvnrand...
dataout = mvnrnd(mu, sigma, N);

end

