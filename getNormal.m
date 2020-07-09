% Get sample values generated from a zero-mean normal distribution
%
% Input:
%   sig   - the standard deviation of the normal distribution
%   nsize - the sample size (an integer >= 1)
%
% Output:
%   x   - vector of size 1 x 'nsize'. The elements of this vector are
%         the sample values of the normal N(0,sig^2) distribution
function x=getNormal( sig, nsize )
    x = normrnd(0,sig,1,nsize);  % <=== fill-in the code 
end
