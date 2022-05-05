%%  CONTROL NO LINEAL
%   Autor: Oscar M. Castro

close all, clear all, clc;

% Teniendo el modelo LTI
% ddx + 5dx + 8x = u
% donde:    ddx = segunda derivada de x
%           dx = primera derivada de x
%           u = señal de entrada
% Realice un análisis en el tiempo y en la frecuencia usando Matlab
% Para u1 = 0.5, u2 = 0.8, u3 = 1.3, u4 = sin(5t)

% G =         1
%       -------------
%       s^2 + 5 s + 8   

s = tf('s');

G = 1/(s^2 + 5*s + 8);

t = 0:0.01:10;
[Y1, T, X1] = step(0.5*G, t);
[Y2, T, X2] = step(0.8*G, t);
[Y3, T, X3] = step(1.3*G, t);

figure(),
    plot(t, Y1, 'b', t, Y2, 'r', t, Y3, 'k');
    grid on; hold on;
    
u = sin(5*t);
[Y4, T, X4] = lsim(G,u,t);

    plot(t, Y4, 'g');
    legend('u=0.5','u=0.8','u=1.3','u=sin5t');
