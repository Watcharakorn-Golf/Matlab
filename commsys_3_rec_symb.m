% EIE/ENE 324 Communication and Telecommunication Laboratory
% Experiment: simulation of a simple digital communication system
% Template provided by Watcharapan Suwansantisuk
% Part 3: the receiver (received symbol)
function commsys_3_rec_symb
clear all; % clear all variable
nsize = 10000; % sample size

%---- part 3 ----
sig = sqrt(0.1);  % <=== fill-in the value of sig you used in part 2
plotYHist( sig, nsize ); % plot the sample values and histogram

end

% Get the pdf of the recieved symbol
%
% Input:
%   t     - a vector of numbers
%   sig   - standard deviation of the normal distribution
% Output:
%   pdf   - a vector of pdf, evaluated at the values in 't'
function pdf = getPdfY( t, sig )
    % use the value of p that was assigned to you in class
   % pdf = sig*zeros( size(t) );  % <== fill-in the code
    pdf = 0.5*normpdf(t-1,0,sig)+0.5*normpdf(t+1,0,sig);
 
   
end


function plotYHist( sig, nsize )

    p = 0.5;   % <==== fill-in the value of p (assigned to you in class)

    % get the received symbols
    x = getBernoulli( nsize );   % transmitted bits
    z = getNormal( sig, nsize ); % noise
    y = x + z;  % received symbols
    
    t = linspace( -1-3*sig, 1+3*sig, 30 ); % value for the bar

    nsize = length(y);
    % Relative frequency
    clf;
    rel_freq = hist(y,t) / (t(2)-t(1)) / nsize;
    bar( t, rel_freq, 'BarWidth',1,'FaceColor','y');
    hold on;
    
    tt = linspace( -1-3*sig, 1+3*sig );
    pdf = getPdfY( tt, sig );
    plot( tt, pdf, 'Linewidth', 2 );
    
    % legend, axes, title
    legend('Rel. freq', 'pdf of Y', 'Location', 'best');
    str = sprintf('nsize=%g, p=%g, sig=%g', nsize, p, sig );
    title({'Part 3: Relative frequency and the pdf of recieved symbol', str } );
    xlabel('value');
    ylabel('Rel. freq or pdf');


end