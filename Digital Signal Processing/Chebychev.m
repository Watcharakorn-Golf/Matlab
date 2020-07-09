ohm_max = 300;
K=500;
k=0;K;
ohm=k*ohm_max/K;
H=1./((j*ohm)+0.1493*100-j*0.9038*100)*((j*ohm)+0.2986*100)*((j*ohm)+0.1493*100+j*0.9038*100);
HdB=20*log10(abs(H));
figure
plot(ohm,HdB)
xlabel('freq')
ylabel('decibel')
title('Chebychev LPF')
set(gca,'xtick',[100 250])
set(gca,'ytick',[-28 -25 -3 0])
axis([0 1000 -100 1])
grid
