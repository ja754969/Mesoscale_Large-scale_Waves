clear;clc;close all
k_x = linspace(0,6,50);
% k_y = linspace(-4,4,100);
k_y = linspace(-6,6,50);
[k_x,k_y] = meshgrid(k_x,k_y);
% omega = 2.*k_x./(k_x.^2+k_y.^2+1);
% omega = 20.*k_x./(k_x.^2+k_y.^2);
omega = k_x./k_y;
% omega(omega<0)=NaN;
%% Phase speed calculation
c_p = 1./k_y + (k_x.^2)./(k_y.^2)*i;
%% Group velocity calculation
c_g = 1./k_y - k_x./(k_y.^2)*i;
%%
fig=figure
fig.PaperUnits = 'centimeters';
fig.PaperSize = [29.7 21]; % A4 papersize (horizontal,21-by-29.7 cm,[width height])
fig.PaperType = '<custom>';
fig.WindowState = 'maximized';
fig;
ax=axes
mqr1 = quiver(k_x,k_y,real(c_p),imag(c_p),0);
% scale = 50000; % omega = 2.*k_x./(k_x.^2+k_y.^2+1);
scale = 0.001; % omega = k_x./k_y;
mqr1.Color = 'k';
mqr1.LineWidth = 1.5;
mqr1.LineStyle = '-';
mqr1.MarkerFaceColor = 'b';
mqr1.MaxHeadSize = 1;
mqr1.MarkerSize = 1;
hU1 = get(mqr1,'UData');
hV1 = get(mqr1,'VData');
set(mqr1,'UData',scale*hU1,'VData',scale*hV1)
xlabel('k_x');ylabel('k_y');
hold on;
% quiver(k_x,k_y,gradE_omega,gradN_omega,'k')
mqr2 = quiver(k_x,k_y,real(c_g),imag(c_g),0);
% scale = 50000; % omega = 2.*k_x./(k_x.^2+k_y.^2+1);
scale = 0.001; % omega = k_x./k_y;
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