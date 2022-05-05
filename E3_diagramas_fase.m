% Laboratorio 2
% Curso: Control no lineal
% Actividad: 2
% Descripción: Generar plano de fase del modulo con masa lineal

close all; clear all; clc;
syms x1 x2 x3

% valores máximos y mínimos de retrato de fase
xmax=deg2rad(180); % rad
xmin=-deg2rad(180); % rad
ymax=5; % rad/s
ymin=-5; % rad/s

deltax = 0.1; % tamaño de paso en eje x
deltay = 1; % tamaño de paso en eje y

% configuración de la figura
figure(1), hold on, grid on, box on,
    set(gcf,'units','pixel','position',[100,100,1000,500])
    axis([xmin xmax ymin ymax])
    xlabel('$\mathrm{x_1}$ (rad)', 'interpreter', 'latex')
    ylabel('$\mathrm{x_2}$ (rad/s)', 'interpreter', 'latex') 

% generar retrato de fase: velocidad inicial 0 rad/s
x2_plot = 0; % rad/s
% xmin = -1.6416;
% xmax = -0.6416;
xmin = -5;
xmax = 5;
% x1_plot = [-1.6416 -1.1416 -0.6416];
for x1_plot=xmin:deltax:xmax
    [ts,ys] = ode45(@model_actividad1,[0,100],[x1_plot;x2_plot;0]);
    plot(ys(:,1),ys(:,2), 'Linewidth', 1)
    % marcador para el primer punto de la trayectoria
    plot(ys(1,1), ys(1,2), 'marker', '.', 'MarkerSize', 30, 'MarkerEdgeColor','g')
    % marcador para el último punto de la trayectoria
    plot(ys(end,1), ys(end,2), 'marker', '.', 'MarkerSize', 30, 'MarkerEdgeColor','r')     
%     pause(2)
%     display(x1_plot)
end

legend('P1 = -1.6416', 'P2 = -1.1416', 'P3 = -0.6416');
% marcador para el primer punto de la trayectoria
% figure(2); 
% plot(ys(:,1), ys(:,1), 'marker', '.', 'MarkerSize', 30, 'MarkerEdgeColor','g')

% % modelo no lineal (COMPLETAR)
% function dx=model_actividad3(t,x)
%     % parámetros del sistema
%     Jeq = 0.000020886;
%     Rm= 8.4;
%     kt= 0.042;
%     km= 0.042;
%     a = Jeq*Rm/kt;
%     
%     % ganancias de control
%     kp= 3;
%     kd= x(2)^2 - pi/4;
%     ki= 10;
%     
%     % señal de control
%     u = a*(-kp*x1-kd*x2-ki*x3)+km*x2;
% 
%     % zona muerta del sistema con masa lineal (NO MODIFICAR)
%     if abs(u)<=0.25
%         u = 0;
%     end
% 
%     % forma de espacio de estados
%     % x1= posición
%     % x2= velocidad
%     % x3= integral de posición
%     dx = [0; 0; 0];
%     dx(1) = x(2);
%     dx(2) = -kp*x(1) - kd*x(2) - ki*x(3);
%     dx(3) = x(1);   
% 
% end

% modelo no lineal
function dx=model_actividad1(t,x)

    I = 0.0042;
    km = 0.0420;
    th_c = pi/4;

%     kp= 9;
%     kd = 9 - (x(1)^2-th_c);
%     ki = 5;

    kp= 3;
    kd = (x(2)^2-th_c);
    ki = 10;

    u = I*(-kp*x(1) - kd*x(2) - ki*x(3)) + km*x(2);
    if abs(u)<=0.25
        u = 0;
    end
    dx = [0; 0; 0];
    dx(1) = x(2);
    dx(2) = (u)/I - km*x(2)/I;
    dx(3) = x(1);   

end

