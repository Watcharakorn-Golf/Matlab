% Get sample values generated from the {-1,+1}-Bernoulli distribution with
% parameter p. (Use the value of p assigned to you in class)
%
% Input:
%   nsize - the sample size (an integer >= 1)
%
% Output:
%   x   - vector of size 1 x 'nsize'. The elements of this vector are
%         the sample values +1's and -1's
function x=getBernoulli( nsize )
   % x = ones( 1, nsize );  % fill-in the code
    t = binornd(1,0.5,1,nsize);
    t(t==0) = -1;
    %x = 2*t-1;
     x=t;
end
