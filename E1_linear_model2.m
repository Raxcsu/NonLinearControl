%%  CONTROL NO LINEAL
%   Autor: Oscar M. Castro

close all, clear all, clc;

% Determina la respuesta temporal del sistema para una entrada
% escalón de 1u de amplitud en los primeros 5 seg.

% dv + |v|v = u

syms v(t)

u = 1;

eqn = diff(v,t)==u-abs(v)*v;
cond=[v(0)==0];

S=dsolve(eqn,cond);

% S =
%  
%        tanh(t)
% -tanh(t*1i)*1i

S=S(1);         % Seleccionamos la respuesta real

t = 0:0.01:5;
y = eval(S);

figure(),
    plot(t,y,'b'); grid on; hold on;
    
% Determina la respuesta temporal del sistema para una entrada
% escalón de 10u de amplitud en los primeros 5 seg.

syms v(t)
u = 10;

eqn = diff(v,t)==u-abs(v)*v;
cond=[v(0)==0];

S=dsolve(eqn,cond);

% S =
%  
% -10^(1/2)*tanh(10^(1/2)*t*1i)*1i
%        10^(1/2)*tanh(10^(1/2)*t)

S=S(2);         % Seleccionamos la respuesta real

t = 0:0.01:5;
y2 = eval(S);

    plot(t,y2,'r');
    legend('u=1u','u=10u');