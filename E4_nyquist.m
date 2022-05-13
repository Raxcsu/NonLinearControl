%%  CONTROL NO LINEAL - DIAGRAMA DE NYQUIST
%   Autor: Oscar M. Castro

close all, clear all, clc;

s=tf('s');

G=1/(s^2+s+1);

figure(),
    nyquist(G)
    
%%

s=tf('s');

G=5/(s+1)^3;

figure(),
    nyquist(G)
    
T=feedback(G,1)
damp(T)

%%

s=tf('s');

G=1.6/(s+1)/(s+2)/(s-0.5);

figure(),
    nyquist(G)
    
T=feedback(G,1)
damp(T)