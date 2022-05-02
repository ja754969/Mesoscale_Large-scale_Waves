clear;clc;close all
k_x = linspace(0,2,100);
k_z = linspace(-2,2,100);
% k_y = linspace(-20,20,100);
[k_x,k_z] = meshgrid(k_x,k_z);
N = sqrt(9.81/1025*2/10); % Brunt–Väisälä frequency
omega = N.*k_x./sqrt(k_x.^2+k_z.^2);
% omega = 2.*k_x./(k_x.^2+k_z.^2+1);
%% Phase speed calculation
c_p = N./sqrt(k_x.^2+k_z.^2) + k_x./k_z.*N./sqrt(k_x.^2+k_z.^2)*i;
%% Group velocity calculation
c_g = (k_z.^2).*N./((k_x.^2+k_z.^2).^(3/2)) - k_x.*k_z.*N./((k_x.^2+k_z.^2).^(3/2))*i;
%%
fig=figure
fig.PaperUnits = 'centimeters';
fig.PaperSize = [29.7 21]; % A4 papersize (horizontal,21-by-29.7 cm,[width height])
fig.PaperType = '<custom>';
fig.WindowState = 'maximized';
fig;
ax=axes
mqr1 = quiver(k_x,k_z,real(c_p),imag(c_p),0);
scale = 0.1; 
mqr1.Color = 'k';
mqr1.LineWidth = 1.5;
mqr1.LineStyle = '-';
mqr1.MarkerFaceColor = 'b';
mqr1.MaxHeadSize = 1;
mqr1.MarkerSize = 1;
hU1 = get(mqr1,'UData');
hV1 = get(mqr1,'VData');
set(mqr1,'UData',scale*hU1,'VData',scale*hV1)
xlabel('k_x');ylabel('k_z');
hold on;
% quiver(k_x,k_y,gradE_omega,gradN_omega,'k')
mqr2 = quiver(k_x,k_z,real(c_g),imag(c_g),0);
mqr2.Color = 'r';
mqr2.LineWidth = 1.5;
mqr2.LineStyle = '-';
mqr2.MarkerFaceColor = 'b';
mqr2.MaxHeadSize = 1;
mqr2.MarkerSize = 1;
hU1 = get(mqr2,'UData');
hV1 = get(mqr2,'VData');
set(mqr2,'UData',scale*hU1,'VData',scale*hV1)
hold off;
% axis tight
% ax.XLim = [0 max(k_x(:))];
% % ax.YLim = [0 max(k_y(:))];
% ax.YLim = [0 2];
ax.FontSize = 20;
ax.TickDir = 'both';
legend([mqr1,mqr2],{'phase speed','group velocity'},'Location','best');
