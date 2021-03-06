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

%% 

close all, clear all, clc;

s=tf('s');

G=1/s/(s+1)/(s+0.2);

figure(),
    nyquist(G)
    
A=0:0.01:10;

k=5; b=0.2;

N=2*k/pi*(pi/2-asin(b./A)-b./A.*sqrt(1-(b./A).^2));

F=-1./N;

RF=real(F);
IF=imag(F);

    hold on, plot(RF,IF,'r')
    axis([-5 1 -0.9 0.9])
    legend('G(s)','-1/N(A.w)')

%

syms w
eqn0 = w^3*1i + (6*w^2)/5 - (w*1i)/5==0;
S = solve(eqn0)
%  5^(1/2)/5= 0.4472

%% EJERCICIO 3

close all, clear all, clc;

s=tf('s');

G=10/(s^2+2*s+3.6)/s;

figure(),
    nyquist(G)
    
A=0:0.01:10;

U=0.5; k=10; a=U/k;

N=2*k/pi.*(asin(a./A)+a./A.*sqrt(1-a^2./A.^2));

F=-1./N;

RF=real(F);
IF=imag(F);

    hold on, plot(RF,IF,'r')
    axis([-1.8 0.1 -0.4 0.4])
    legend('G(s)','-1/N(A.w)')
%%
syms w
N2 = ((j*w)^3+2*(j*w)^2+3.6*j*w)/-10;
expand(N2)
% (w^3*1i)/10 + w^2/5 - (w*9i)/25
% (w^3*1i)/10 - (w*9i)/25 + w^2/5
% -----------------------   ------
%       imag                  real

% Calculamos 'w'
eqn0 = (w^3)/10 - (w*9)/25==0;
S = solve(eqn0)
% w = -1.8974  --> -(3*2^(1/2)*5^(1/2))/5

% Calculamos 'A'
syms Ax
U=0.5; k=10; a=U/k;
eqn1 = 2*k/pi*(asin(a/Ax)+a/Ax*sqrt(1-a^2/Ax^2))==2.5920;
S = solve(eqn1)

%% EJERCICIO 4

close all, clear all, clc;

s=tf('s');

U=4; k=1;
G=10*k/(s*(s+1)^2);

figure(),
    nyquist(G)
    
A=0:0.001:30;

N=4*U./A/pi;

F=-1./N;

RF=real(F);
IF=imag(F);

    hold on, plot(RF,IF,'r')
    axis([-5.5 0.1 -1.4 1.4])
    legend('G(s)','-1/N(A.w)')
    
%%
syms w
% G=10*k/(s*(s+1)^2);
N2 = ((j*w)*(j*w+1)^2)/-10;
expand(N2)

% Calculamos 'w'
eqn0 = (w^3)/10- (w)/10==0;
S = solve(eqn0)
% w = 1 o -1

% Calculamos 'A'
syms Ax
eqn1 = 4*U/Ax/pi == 1/5;
S = solve(eqn1)