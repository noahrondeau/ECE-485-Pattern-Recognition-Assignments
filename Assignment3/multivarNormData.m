% PART A: Function to generate d dimensional data
function dataout = multivarNormData(N, mu, sigma)
%multivarNormData Generates N random numbers from multivariate dist
%   This is really just a wrapper function around mvnrand...
dataout = mvnrnd(mu, sigma, N);

end

