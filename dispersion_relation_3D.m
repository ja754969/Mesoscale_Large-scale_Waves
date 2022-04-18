clear;clc;close all
k_x = linspace(0,6,500);
k_z = linspace(-6,6,500);
% k_y = linspace(-20,20,100);
[k_x,k_z] = meshgrid(k_x,k_z);
N = sqrt(9.81/1025*2/10); % Brunt–Väisälä frequency
omega = N.*k_x./sqrt(k_x.^2+k_z.^2);
% omega = 2.*k_x./(k_x.^2+k_z.^2+1);
%% Group velocity calculation
[aspect,slope,gradH_omega,gradE_omega] = gradientm(k_z,k_x,omega);
velocity = sqrt(gradH_omega.^2+gradE_omega.^2);
% c_g = 
%%
fig=figure
fig.PaperUnits = 'centimeters';
fig.PaperSize = [29.7 21]; % A4 papersize (horizontal,21-by-29.7 cm,[width height])
fig.PaperType = '<custom>';
fig.WindowState = 'maximized';
fig;
ax=axes
[C,h] = contourf(k_x,k_z,omega);
clabel(C,h);
colorbar
% caxis([0 max(omega(:))])
xlabel('k_x');ylabel('k_z');
hold on;
% quiver(k_x,k_y,gradE_omega,gradN_omega,'r')
mqr = quiver(k_x,k_z,gradE_omega,gradH_omega,0);
scale = 10000; 
mqr.Color = 'r';
mqr.LineWidth = 1;
mqr.LineStyle = '-';
mqr.MarkerFaceColor = 'b';
mqr.MaxHeadSize = 5;
hU1 = get(mqr,'UData');
hV1 = get(mqr,'VData');
set(mqr,'UData',scale*hU1,'VData',scale*hV1)
hold off;
% axis tight
ax.XLim = [0 max(k_x(:))];
% xlim([0 1])
% ax.YLim = [0 max(k_z(:))];
% ylim([0 max(k_y(:))])
% ylim([0 4])
ax.FontSize = 20;
ax.TickDir = 'both';