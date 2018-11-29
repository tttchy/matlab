%������������������������������MATLAB��������nc��������������������������������%
%��������author��XMM                                   time��2017-04-01����%
%��������update time:2017-04-03                        
%������������������������������������������������������������������������������%
clear all; %���
close;
clc;
%����������������������matlab������ȡnc���ݲ������mat��ʽ��������������������%
PathName='D:\������ʵϰ\2013\apr\';%·��
file_names=dir(fullfile(PathName,'*2013040*.nc')); %ѡȡ����2013040������
k=length(file_names);
filename=[PathName,file_names(1).name]
ncdisp(filename);
for i=1:k %ѭ������Ϊ��L2C���ļ�����
   filename=[PathName,file_names(i).name];
   lat=ncread(filename,'lat');
   lon=ncread(filename,'lon');
   u=ncread(filename,'u');
   v=ncread(filename,'v');
   disp(i);
   OutputPath='D:\������ʵϰ\2013\apr\test\';
   OutputName=strcat(file_names(i).name(26:33)); 
   save(strcat(OutputPath,OutputName,'.mat'),'lat','lon','u','v');
end
%����������������������������ѡȡ�ض���γ�ȡ�����������������������������������%
PathName='D:\������ʵϰ\2013\apr\test\'
file_names=dir(fullfile(PathName,'*.mat'));
timenum=datenum(2014,1:12,15);%ת��Ϊ�����洢������
datetime=datestr(timenum,30);%ת��Ϊʮ��������
latmin=20;
latmax=42;
lonmin=110;
lonmax=140;
for iii=1:size(file_names);
load([PathName,file_names(iii).name]);
Nlat=find(lat<=latmax&lat>=latmin);
Nlon=find(lon<=lonmax&lon>=lonmin);
lat=lat(Nlat);
lon=lon(Nlon);
[Lon,Lat]=meshgrid(lon,lat);
u=u(Nlon,Nlat);
v=v(Nlon,Nlat);
u=u';v=v';
vel=sqrt(u.^2+v.^2);%�⵽���Ǹ�ɶ���Ƕ����𣿾����ų������ʵ����ݣ�
u(vel>100)=nan;
v(vel>100)=nan;
mask=ones(size(vel));
mask(isnan(vel))=nan;
%����������������������������������ͼ����������������������������������������������������������������%
 figure
   m_proj('mercator','lon',[lonmin lonmax],'lat',[latmin latmax]);
   hold on;
   m_gshhs_i('patch',[.5 .5 .5],'edgecolor','k');%edgecolorΪ��ɫ
  % m_gshhs_i('patch',[.8 .8 .8]);   % grey
   m_grid('linest','none','box','on','tickdir','in','fontname','Times New Roman','fontsize',15);
   step=1;Lscale=10;
   h=m_quiver(Lon(1:step:end,1:step:end).*mask(1:step:end,1:step:end),...
         Lat(1:step:end,1:step:end).*mask(1:step:end,1:step:end),...
         u(1:step:end,1:step:end)*Lscale.*mask(1:step:end,1:step:end),...
         v(1:step:end,1:step:end)*Lscale.*mask(1:step:end,1:step:end),0,'k') 
     m_quiver(114,35.5,Lscale,0,0,'k') 
     m_text(114,36.5,'1m/s','fontsize',20)
     xlabel('longitude','fontname','Times New Roman','fontsize',12)
     ylabel('latitude','fontname','Times New Roman','fontsize',12)
     title(datetime(iii,1:8),'fontsize',20,'BackgroundColor',[255 255 255]/255);
%�����������������������������洢Ϊgif��ʽ��ͼ����������������������������������������%     
% set(gcf,'outerposition',get(0,'ScreenSize'))
% [RGB,ccmap]=getframe(gcf);
% [X,cmap] = rgb2ind(RGB,128);
% if iii==1
% imwrite(X,cmap,'ECS_current.gif'); 
% else
% imwrite(X,cmap,'ECS_current.gif', 'WriteMode', 'append','DelayTime',1); 
% end 
% close
%��������������������������������ͼ�񡪡�����������������������������������������%
     str=sprintf('Month%d',iii);%ͼ���ļ�������
     figurename=[PathName,str]%ͼ���ļ�������
     saveas(h,figurename,'png'); %����ͼ��   
end



