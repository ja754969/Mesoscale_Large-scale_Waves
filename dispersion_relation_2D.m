clear;clc;close all
k_x = linspace(0,20,100);
% k_y = linspace(-4,4,100);
k_y = linspace(-20,20,100);
[k_x,k_y] = meshgrid(k_x,k_y);
% omega = 2.*k_x./(k_x.^2+k_y.^2+1);
% omega = 20.*k_x./(k_x.^2+k_y.^2);
omega = k_x./k_y;
% omega(omega<0)=NaN;
%% Group velocity calculation
[aspect,slope,gradN_omega,gradE_omega] = gradientm(k_y,k_x,omega);
velocity = sqrt(gradN_omega.^2+gradE_omega.^2);
% c_g = 
%%
fig=figure
fig.PaperUnits = 'centimeters';
fig.PaperSize = [29.7 21]; % A4 papersize (horizontal,21-by-29.7 cm,[width height])
fig.PaperType = '<custom>';
fig.WindowState = 'maximized';
fig;
ax=axes
[C,h] = contourf(k_x,k_y,omega);
clabel(C,h)
colorbar
caxis([0 max(omega(:))])
xlabel('k_x');ylabel('k_y');
hold on;
% quiver(k_x,k_y,gradE_omega,gradN_omega,'k')
mqr = quiver(k_x,k_y,gradE_omega,gradN_omega,0);
% scale = 50000; % omega = 2.*k_x./(k_x.^2+k_y.^2+1);
scale = 100; % omega = k_x./k_y;
mqr.Color = 'r';
mqr.LineWidth = 1.5;
mqr.LineStyle = '-';
mqr.MarkerFaceColor = 'b';
mqr.MaxHeadSize = 5;
mqr.MarkerSize = 15;
hU1 = get(mqr,'UData');
hV1 = get(mqr,'VData');
set(mqr,'UData',scale*hU1,'VData',scale*hV1)
hold off;
% axis tight
ax.XLim = [0 max(k_x(:))];
% ax.YLim = [0 max(k_y(:))];
ax.YLim = [0 2];
ax.FontSize = 20;
ax.TickDir = 'both';