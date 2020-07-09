% EIE/ENE 324 Communication and Telecommunication Laboratory
% Experiment: simulation of a simple digital communication system
% Template provided by Watcharapan Suwansantisuk
% Part 4: the receiver (decoded bit)
function commsys_4_detect
clear all; % clear all variables
snr_dB_list = [-10:1:5];  % SNRs (dB) to simulate the BER
nsize = 10000;  % sample size

%---- part 4 ----
p = 0.5;   % <=== fill-in the value of p assigned to you
sigList = fromSNRdB( snr_dB_list, p ); % convert SNR(dB) to std of noise
ber = simulateBER( p, sigList, nsize ); % simulate the bit error rate (BER)
plotBER( snr_dB_list, ber, p ); % plot the BER vs SNR (dB)

end

% Convert a list of the SNR in dB to standard deviation of the Guassian
% noise
% Input:
%   snr_dB_list  - a vector of SNR (dB)
%    p   - the probability that a bit +1 is sent at the transmitter
% Output:
%   sigList - a vector of the same size as snr_dB_list, where sigList(i) is
%             the standard deviation of the Gaussian noise that produces
%             the SNR (dB) of snr_dB_list(i)
function sigList = fromSNRdB( snr_dB_list, p )
   % sigList = snr_dB_list;  % <== student fill-in
   sigList = sqrt(p ./ (10.^(snr_dB_list/10)));
end

% Decode the received symbols
% Input:
%    y   - a vector of received symbols (real numbers)
%    p   - the probability that a bit +1 is sent at the transmitter
%    sig - the standard deviation of Gaussian noise
% Output:
%    xhat - a vector of +1's and -1's, of the same size of 'y'.
%           xhat(i) is the decoded bit for the received symbol y(i)
function xhat = decide( y, p, sig )
    
    xhat(y<=0) = -1;
    xhat(y>0) = 1;
   % xhat = ones( size(y) );
    % --- fill-in the code ---
end

% Simulate the bit error rate (BER) for each value of sigma's
%
% Input:
%    p       - the probability that a bit +1 is sent at the transmitter
%    sigList - a vector of the standard deviation of Gaussian noise at the
%              channel
%    nsize   - the sample size for the simulation. This function generates
%              'nsize' of +1, and 'nsize' of -1.
% Output:
%    ber     - the vector where ber(i) is the simulated BER for the
%              the given 'p', the given sigList(i)
function ber=simulateBER( p, sigList, nsize )

    ber = zeros( size(sigList) ); % initialize BERs to zero
    k = 1; % index of ber
    for sig=sigList % loop to each value of sigma

        % send +1
        x1 = ones(1,nsize); % transmitted bits (+1's)
        y1 = x1 + getNormal(sig,nsize); % received symbols
        xhat1 = decide( y1, p, sig );   % decoded bits
        ber1 = sum( xhat1 ~= x1 ) / nsize;  % relative # of error bits

        % send -1
        x0 = -x1; % transmitted bits (-1's)
        y0 = x0 + getNormal(sig,nsize); % received symbols
        xhat0 = decide( y0, p, sig );   % decoded bits
        ber0 = sum( xhat0 ~= x0 ) / nsize; % relative # of error bits

        % compute the empirical value of the BER
        ber(k) = ber0*(1-p) + ber1*p;
        k = k+1;
    end
end

% plot the empirical BER vs the SNR (dB), and the theoretical value
% of the BER using the maximum likelihood estimate (MLE)
% Input:
%   snr_dB_list  - the SNR (dB) for the x-axis
%   ber          - empirical (simulated) value of the BER, a vector the
%                  same size as 'snr_dB_list'
%   p            - value of p, i.e., Pr{X=+1}, for the transmitted bits
function plotBER(snr_dB_list, ber, p)
    clf; % clear the figure
    % plot the simulated BER vs SNR (dB)
    semilogy( snr_dB_list, ber, 'ob', 'Linewidth', 2 );
    xlabel('SNR (dB)');
    ylabel('BER');
    title( ['Part 4: Bit error rate (BER) at different ', ...
            'signal to noise ratios (SNRs)']);

    % plot the BER where the decision rule is the MLE
    hold on;
    s = linspace( snr_dB_list(1), snr_dB_list(end) );
    s = snr_dB_list;
    sigs = fromSNRdB( s, p );
    perr = 1 - p*normcdf(1./sigs - sigs/2*log((1-p)/p)) ...
        - (1-p)*normcdf(1./sigs + sigs/2*log((1-p)/p) );
    semilogy( s, perr, 'r', 'Linewidth', 2 );
    
    grid on;
    legend('Simulation (my decision rule)', 'Baseline (MLE)', ...
        'Location', 'best');
end