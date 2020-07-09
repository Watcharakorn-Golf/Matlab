N=161;
n=0:N-1;
alpha=(N-1)/2;
hd=sin(0.405*pi*(n-alpha))./(pi*(n-alpha));
hd(81)=0.405;
wham=hamming(N);
h=hd.*wham';
k=0:200;
w=(pi/200)*k;
H=h*exp(-j*n'*w);
magH=abs(H);
dB=20*log10(magH);
figure
plot(w/pi,dB)
xlabel('freq')
ylabel('decibel')
title('FIR LPF by Hamming Window')
set(gca,'xtick',[0.4 0.6])
set(gca,'ytick',[-40 -3 0])
axis([0 1 -100 2])
grid
