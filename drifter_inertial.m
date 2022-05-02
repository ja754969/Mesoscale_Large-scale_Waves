clear;clc;close all
%% READ THE DATA
% 1~5 : ID #	Position	Time	(MM DD.dd YYYY)     Latitude	
% 6~10 : Longitude	SST (Deg C) VE (cm/s)	VN (cm/s)	SPD (cm/s)	
% 11~13 : Var.Lat       Var.Lon     Var.Temp
load('./buoydata_Taiwan.mat')
%%
hour_data = 24*(buoydata_Taiwan(:,3)-floor(buoydata_Taiwan(:,3)));
time = datetime(buoydata_Taiwan(:,4),buoydata_Taiwan(:,2),...
    floor(buoydata_Taiwan(:,3)),hour_data,0,0);
latitude = buoydata_Taiwan(:,5);
longitude = buoydata_Taiwan(:,6);
%% Theoretical inertial period
target_lat = 22;
angular_velocity_Earth = 2*pi/((23+56/60)*60*60);
f = 2*angular_velocity_Earth*sind(target_lat); % Coriolis parameter
theoretical_inertial_period = (2*pi/f)/60/60; % original unit : seconds
%% Trajectory
LON_lim = [117 121];
LAT_lim = [19 26];
LON_lim1 = [117+40/60 118+40/60];
LAT_lim1 = [19.5 20];
LON_lim2 = [118+24/60 119+12/60];
LAT_lim2 = [19+48/60 20.5];
bndry_lon1 = [LON_lim1(1) LON_lim1(1) LON_lim1(end) LON_lim1(end) LON_lim1(1)];
bndry_lat1 = [LAT_lim1(1) LAT_lim1(end) LAT_lim1(end) LAT_lim1(1) LAT_lim1(1)];
bndry_lon2 = [LON_lim2(1) LON_lim2(1) LON_lim2(end) LON_lim2(end) LON_lim2(1)];
bndry_lat2 = [LAT_lim2(1) LAT_lim2(end) LAT_lim2(end) LAT_lim2(1) LAT_lim2(1)];
fig=figure
fig.PaperUnits = 'centimeters';
fig.PaperSize = [29.7 21]; % A4 papersize (horizontal,21-by-29.7 cm,[width height])
fig.PaperType = '<custom>';
fig.WindowState = 'maximized';
fig;
ax1=axes
ax1.Position = [0.05 0.05 0.3 0.9];
m_proj('miller','lon',[LON_lim(1) LON_lim(end)],'lat',[LAT_lim(1) LAT_lim(end)]);
m_line(bndry_lon1,bndry_lat1,'linewi',2,'color','r');
m_line(bndry_lon2,bndry_lat2,'linewi',2,'color','r');
hold on;
m_plot(longitude,latitude,'b+','linestyle','-')
hold on;
m_gshhs_f('patch',[0 0 0]);
m_grid('box','-','tickdir','both','FontSize',15)
hold off;
title('Time steps : 6 hours','FontSize',20)

ax2=axes
ax2.Position = [0.3 0.05 0.6 0.32];
m_proj('miller','lon',[LON_lim1(1) LON_lim1(end)],'lat',[LAT_lim1(1) LAT_lim1(end)]);
m_plot(longitude,latitude,'b+','linestyle','-')
hold on;
m_gshhs_c('patch',[0 0 0]);
m_grid('box','-','tickdir','both','FontSize',15)
start_time = char(time(20));
end_time = char(time(32));
m_text(longitude(20),latitude(20),start_time,'Color','r','HorizontalAlignment','right');
m_text(longitude(24),latitude(24),char(time(24)),'Color','r','HorizontalAlignment','right');
m_text(longitude(28),latitude(28),char(time(28)),'Color','r','HorizontalAlignment','left');
m_text(longitude(32),latitude(32),char(time(32)),'Color','r','HorizontalAlignment','left');
hold off;


ax3=axes
ax3.Position = [0.4 0.42 0.5 0.59];
m_proj('miller','lon',[LON_lim2(1) LON_lim2(end)],'lat',[LAT_lim2(1) LAT_lim2(end)]);
m_plot(longitude,latitude,'b+','linestyle','-')
hold on;
m_gshhs_c('patch',[0 0 0]);
m_grid('box','-','tickdir','both','FontSize',15)
start_time = char(time(53));
end_time = char(time(57));
m_text(longitude(53),latitude(53),start_time,'Color','r','HorizontalAlignment','left');
m_text(longitude(57),latitude(57),end_time,'Color','r','HorizontalAlignment','left');
m_text(longitude(61),latitude(61),char(time(61)),'Color','r','HorizontalAlignment','right');
m_text(longitude(64),latitude(64),char(time(64)),'Color','r','HorizontalAlignment','right');
m_text(longitude(68),latitude(68),char(time(68)),'Color','r','HorizontalAlignment','right');
m_text(longitude(72),latitude(72),char(time(72)),'Color','r','HorizontalAlignment','right');
hold off;