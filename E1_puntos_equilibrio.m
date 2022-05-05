%%  CONTROL NO LINEAL - PUNTOS DE EQUILIBRIO
%   Autor: Oscar M. Castro

close all, clear all, clc;

syms x(t) x0

eqn = diff(x,t)==-x+x^2;
cond=[x(0)==x0];

S=dsolve(eqn,cond);

% S = -1/(exp(t + log(1 - 1/x0)) - 1

t = 0:0.01:10;

x0 = 0.9;

y = eval(S);

figure(),
    plot(t,y,'b'); grid on; hold on;