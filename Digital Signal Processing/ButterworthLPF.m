ohm_max = 300;
K=500;
k=0;K;
ohm=k*ohm_max/K;
H=1./(1+(ohm/57.1743).^4);
HdB=10*log10(abs(H));
figure
plot(ohm,HdB)
xlabel('freq')
ylabel('decibel')
title('Butter worth LPF')
set(gca,'xtick',[50 250])
set(gca,'ytick',[-27 -25 -2 0])
axis([0 500 -100 1])
grid