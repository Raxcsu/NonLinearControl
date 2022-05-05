%%  CONTROL NO LINEAL - LINEALIZACIÓN
%   Autor: Oscar M. Castro

close all, clear all, clc;

m=0.2;
g=9.81;
l=0.45;
B=0.15;
J=m*l^2;    %momento de inercia de la esfera

syms x1 x2 u

A=jacobian([x2,-B/J*x2-m*g*l/J*sin(x1)],[x1;x2]);

B=jacobian([x2,-B/J*x2-m*g*l/J*sin(x1)],[u]);

% puntos de equilibrio 
x1=0;       %x1=theta
x2=0;       %x2=dtheta

A=eval(A);
B=eval(B);

eig(A);

C=[1 0];        %y=th=x1
D=0;

x10=0.3;
x0=[x10;0];