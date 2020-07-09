% EIE/ENE 324 Communication and Telecommunication Laboratory
% Experiment: simulation of a simple digital communication system
% Template provided by Watcharapan Suwansantisuk
% Part 2: the channel
function commsys_2_channel
clear all;    % clear all variable
nsize = 10000; % sample size


%---- part 2 ----
sig = 1;  % <==== select your own value (standard deviation of noise)

x = getNormal( sig, nsize ); % get a sample of noise
plotNormalHist( x, sig ); % plot the pdf and sample values together

end


% Get the pdf of the normal distribution with mean 0 and standard
% deviatioin 'sig'
%
% Input:
%   t     - a vector of numbers
%   sig   - standard deviation of the normal distribution
% Output:
%   pdf   - a vector of pdf, evaluated at the values in 't'
function pdf=getNormalPDF( t, sig )
    pdf = normpdf(t,0,sig); % <=== fill-in this code
end


function plotNormalHist( x, sig )

    t = linspace( -3*sig, 3*sig, 30 ); % value for the bar
    nsize = length(x);
    % Relative frequency
    clf;
    rel_freq = hist(x,t) / (t(2)-t(1)) / nsize;
    bar( t, rel_freq, 'BarWidth',1,'FaceColor','y');
    hold on;
    
    tt = linspace( -3*sig, 3*sig );
    pdf = getNormalPDF( tt, sig );
    plot( tt, pdf, 'Linewidth', 2 );
    
    % legend, axes, title
    str = sprintf('pdf N(0,%g^2)', sig );
    legend('Rel. freq', str, 'Location', 'best');
    str = sprintf('nsize=%g', nsize );
    title({'Part 2: Relative frequency of data and the pdf of noise', str } );
    xlabel('value');
    ylabel('Rel. freq or pdf');
end