%%  CONTROL NO LINEAL - PLANOS DE FASE
%   Autor: Oscar M. Castro

close all, clear all, clc;

[x1, x2]=meshgrid(-8:0.4:8,-8:0.4:8);
dx1=x2;
dx2=-0.6.*x2-3.*x1-x1.^2;

quiver(x1,x2,dx1,dx2,2);

Pe = [-3 0;
      0 0];

hold on;

f=@(t,X)[X(2);-0.6.*X(2)-3.*X(1)-X(1).^2]

for x20=-3:0.8:3
    for x10=-3:0.8:3
        [t,y]=ode45(f,[0,50],[x10,x20]);
        plot(y(:,1),y(:,2))
    end
end

plot(Pe(:,1),Pe(:,2), 'r.', 'MarkerSize', 30);
axis([-6 6 -6 6])
