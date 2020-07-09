% EIE/ENE 324 Communication and Telecommunication Laboratory
% Experiment: simulation of a simple digital communication system
% Template provided by Watcharapan Suwansantisuk
% Part 1: the transmitter
function commsys_1_transmit

clear all; % clear all variable
nsize = 1000; % sample size

%---- part 1 ----
x = getBernoulli( nsize ); % get a sample
[phat, qhat] = getRelativeFreq( x ); % compute a relative frequency
plotBernoulliHist( x ); % plot the pmf and relative freq together

end


% Get a relative frequency of +1 and -1
% 
% Input:
%   x   - a vector of +1's and -1's
% Output:
%   phat - the relative frequency of +1
%   qhat - the relative frequency of -1
function [phat, qhat] = getRelativeFreq( x )
    nsize = length(x);  % sample size  
    phat = sum(x==1)/ nsize;    % <==== fill-in the code
    qhat = 1-phat;    % <==== fill-in the code
end

% Plot the histrogram of relative frequency and the probability mass
% function (pmf)
%
% Input:
%   x   - a vector of +1's and -1's
%   p   - the parameter used to generated the sample values. p is the
%         probability that a sample value is +1.
function plotBernoulliHist( x )

    p = 0.5;   % <==== fill-in the value of p (assigned to you in class)

    [phat qhat] = getRelativeFreq( x ); % get the relative frequency
    
    clf; % clear figure
    % histogram
    bar( [-1 +1], [qhat phat], 'BarWidth',0.2, 'FaceColor','y');
    hold on;
    % pmf
    stem( [-1 +1], [1-p p], 'Linewidth', 2 );
    % legend, axes, title
    legend('Rel. freq', 'pmf', 'Location', 'best');
    str = sprintf('nsize=%g, phat=%g, p=%g , qhat=%g, q=%g', ...
        length(x), phat, p, qhat, 1-p );
    title({'Part 1: Relative frequency of data and the pmf', str } );
    xlabel('value');
    ylabel('Rel. freq or pmf');
end