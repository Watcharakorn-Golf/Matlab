N=31;
n=0:N-1;
alpha=(N-1)/2;
hd=(sin(pi*(n-alpha))-sin(0.45*pi*(n-alpha))./(pi*(n-alpha)));
hd(16)=0.45;
wk=kaiser(N,2.574)
h=hd.*wk';
k=0:200;
w=(pi/200)*k;
H=h*exp(-j*n'*w);
magH=abs(H);
dB=20*log10(magH);
figure
plot(w/pi,dB)
xlabel('freq')
ylabel('decibel')
title('FIR HPF by Kaiser Window')
set(gca,'xtick',[0.4 0.5 0.6])
set(gca,'ytick',[-33.3761 -3 0])
axis([0 0.99 -110 3])
grid
