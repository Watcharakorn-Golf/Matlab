N=40;
wc1=[0.5*pi];
h1=fir1(N,wc1/pi,'high');
[H1,w1]=freqz(h1,1,200);
magH1=abs(H1);
dB1=20*log10(magH1);
figure
plot(w1/pi,dB1)
xlabel('freq')
ylabel('decibel')
title('FIR LPF by fir1')
set(gca,'xtick',[0.5])
set(gca,'ytick',[-100 -3 0])
axis([0 1 -100 3])
grid
