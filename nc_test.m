%———————————————MATLAB批量处理nc————————————————%
%————author：XMM                                   time：2017-04-01——%
%————update time:2017-04-03                        
%———————————————————————————————————————%
clear all; %清空
close;
clc;
%———————————matlab批量读取nc数据并存放于mat格式——————————%
PathName='D:\大三下实习\2013\apr\';%路径
file_names=dir(fullfile(PathName,'*2013040*.nc')); %选取含有2013040的数据
k=length(file_names);
filename=[PathName,file_names(1).name]
ncdisp(filename);
for i=1:k %循环次数为：L2C的文件个数
   filename=[PathName,file_names(i).name];
   lat=ncread(filename,'lat');
   lon=ncread(filename,'lon');
   u=ncread(filename,'u');
   v=ncread(filename,'v');
   disp(i);
   OutputPath='D:\大三下实习\2013\apr\test\';
   OutputName=strcat(file_names(i).name(26:33)); 
   save(strcat(OutputPath,OutputName,'.mat'),'lat','lon','u','v');
end
%——————————————选取特定经纬度——————————————————%
PathName='D:\大三下实习\2013\apr\test\'
file_names=dir(fullfile(PathName,'*.mat'));
timenum=datenum(2014,1:12,15);%转变为机器存储的数字
datetime=datestr(timenum,30);%转变为十进制数字
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
vel=sqrt(u.^2+v.^2);%这到底是个啥？是动能吗？就是排除不合适的数据？
u(vel>100)=nan;
v(vel>100)=nan;
mask=ones(size(vel));
mask(isnan(vel))=nan;
%————————————————画图————————————————————————————————%
 figure
   m_proj('mercator','lon',[lonmin lonmax],'lat',[latmin latmax]);
   hold on;
   m_gshhs_i('patch',[.5 .5 .5],'edgecolor','k');%edgecolor为黑色
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
%——————————————存储为gif格式动图————————————————————%     
% set(gcf,'outerposition',get(0,'ScreenSize'))
% [RGB,ccmap]=getframe(gcf);
% [X,cmap] = rgb2ind(RGB,128);
% if iii==1
% imwrite(X,cmap,'ECS_current.gif'); 
% else
% imwrite(X,cmap,'ECS_current.gif', 'WriteMode', 'append','DelayTime',1); 
% end 
% close
%——————————————保存图像——————————————————————%
     str=sprintf('Month%d',iii);%图像文件名命名
     figurename=[PathName,str]%图像文件名命名
     saveas(h,figurename,'png'); %保存图像   
end



