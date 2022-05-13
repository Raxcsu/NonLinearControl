%%  CONTROL NO LINEAL - DIAGRAMA DE NYQUIST
%   Autor: Oscar M. Castro

close all, clear all, clc;

s=tf('s');

G=2/(s+1)/(s+2)/(s+4);

figure(),
    nyquist(G)
    
A=0:0.01:10;

k=1; b=20;

N=2*k/pi*(pi/2-asin(b./A)-b./A.*sqrt(1-(b./A).^2));

F=-1./N;

RF=real(F);
IF=imag(F);

    hold on, plot(RF,IF,'r')
    axis([-0.1 0.3 -0.2 0.2])
    legend('G(s)','-1/N(A.w)')

w=sqrt(14);

r=16-14*w0^2;

g=

NR=2*(j*w-1)*(j*w-2)*(j*w-4);
simplify(NR)
    