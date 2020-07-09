N=40;
n=0:N-1;
alpha=(N-1)/2;
hd=(sin(pi*(n-alpha))-sin(0.5*pi*(n-alpha))./(pi*(n-alpha)));
hd(21)=0.5;
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
title('FIR HPF by Hamming Window')
set(gca,'xtick',[0.4 0.5 0.6])
set(gca,'ytick',[-50 -3 0])
axis([0.2 0.99 -110 3])
grid
