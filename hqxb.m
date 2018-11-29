clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');
A=zeros(24,1);
B=zeros(24,1);
C=zeros(24,1);
% 读进去其中一天的污染物数据,读取逐时的气象资料，每张页面画6个时刻的。北京时的，
for k=7%用于读取不同的文件夹
for j=k+1     %%！！！！！！改改改！！！！！！！！
 ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)]; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
 ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];
for i=5:6:24% 每个文件第一个时次是北京时09时，第24个时次是次日08时。
subplot(2,3,1);
Q2=ncread(ncfile,'WSPD10');
Q2=squeeze(Q2(:,:,1,i));
Q22=ncread(ncfile,'RN');
Q22=squeeze(Q22(:,:,1,i));

U=ncread(ncfile2,'UWIND');
V=ncread(ncfile2,'VWIND');
U=squeeze(U(:,:,1,i));
V=squeeze(V(:,:,1,i));

load D:\matlab\MATLAB2014b\MPL_Blues.mat
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q22,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
%hold on;
%m_quiver(lonmodel2,latmodel2,U,V,10,'color','k');%以矢量箭头的方式画图，24是调节箭头大小.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i<17);
str=sprintf('%02d',i+8);%时间时为i，北京时为i+8，
title(['t=',str]);
else
str=sprintf('%02d',i-16);%第二天了， i=24时，为北京时8时。 
title(['t=',str]);
end
colormap(MPL_Blues);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 2]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','MM','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,2);
Q2=ncread(ncfile,'WSPD10');
Q2=squeeze(Q2(:,:,1,i+1));
Q22=ncread(ncfile,'RN');
Q22=squeeze(Q22(:,:,1,i+1));

U=ncread(ncfile2,'UWIND');
V=ncread(ncfile2,'VWIND');
U=squeeze(U(:,:,1,i+1));
V=squeeze(V(:,:,1,i+1));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q22,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
%hold on;
%m_quiver(lonmodel2,latmodel2,U,V,10,'color','k');%以矢量箭头的方式画图，24是调节箭头大小.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+1<17);
str=sprintf('%02d',i+8+1);%时间时为i，北京时为i+8，
title(['t=',str]);
else
str=sprintf('%02d',i-16+1);%第二天了， i=24时，为北京时8时。 
title(['t=',str]);
end
colormap(MPL_Blues);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 2]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','MM','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,3);
Q2=ncread(ncfile,'WSPD10');
Q2=squeeze(Q2(:,:,1,i+2));
Q22=ncread(ncfile,'RN');
Q22=squeeze(Q22(:,:,1,i+2));

U=ncread(ncfile2,'UWIND');
V=ncread(ncfile2,'VWIND');
U=squeeze(U(:,:,1,i+2));
V=squeeze(V(:,:,1,i+2));
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q22,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
%hold on
%m_quiver(lonmodel2,latmodel2,U,V,10,'color','k');%以矢量箭头的方式画图，24是调节箭头大小.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+2<17);
str=sprintf('%02d',i+8+2);%时间时为i，北京时为i+8，
title(['t=',str]);
else
str=sprintf('%02d',i-16+2);%第二天了， i=24时，为北京时8时。 
title(['t=',str]);
end
colormap(MPL_Blues);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 2]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','MM','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,4);
Q2=ncread(ncfile,'WSPD10');
Q2=squeeze(Q2(:,:,1,i+3));
Q22=ncread(ncfile,'RN');
Q22=squeeze(Q22(:,:,1,i+3));

U=ncread(ncfile2,'UWIND');
V=ncread(ncfile2,'VWIND');
U=squeeze(U(:,:,1,i+3));
V=squeeze(V(:,:,1,i+3));
m_contourf(lonmodel,latmodel,Q22,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
%hold on;
%m_quiver(lonmodel2,latmodel2,U,V,10,'color','k');%以矢量箭头的方式画图，24是调节箭头大小.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+3<17);
str=sprintf('%02d',i+8+3);%时间时为i，北京时为i+8，
title(['t=',str]);
else
str=sprintf('%02d',i-16+3);%第二天了， i=24时，为北京时8时。 
title(['t=',str]);
end

colormap(MPL_Blues);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 2]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','MM','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5);
Q2=ncread(ncfile,'WSPD10');
Q2=squeeze(Q2(:,:,1,i+4));
Q22=ncread(ncfile,'RN');
Q22=squeeze(Q22(:,:,1,i+4));

U=ncread(ncfile2,'UWIND');
V=ncread(ncfile2,'VWIND');
U=squeeze(U(:,:,1,i+4));
V=squeeze(V(:,:,1,i+4));
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q22,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
%hold on;
%m_quiver(lonmodel2,latmodel2,U,V,10,'color','k');%以矢量箭头的方式画图，24是调节箭头大小.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+4<17)
str=sprintf('%02d',i+8+4);%时间时为i，北京时为i+8，
title(['t=',str])
else
str=sprintf('%02d',i-16+4);%第二天了， i=24时，为北京时8时。 
title(['t=',str])
end

colormap(MPL_Blues);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 2]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','MM','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,6);
Q2=ncread(ncfile,'WSPD10');
Q2=squeeze(Q2(:,:,1,i+5));
Q22=ncread(ncfile,'RN');
Q22=squeeze(Q22(:,:,1,i+5));

U=ncread(ncfile2,'UWIND');
V=ncread(ncfile2,'VWIND');
U=squeeze(U(:,:,1,i+5));
V=squeeze(V(:,:,1,i+5));
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q22,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
%hold on;
%m_quiver(lonmodel2,latmodel2,U,V,10,'color','k');%以矢量箭头的方式画图，24是调节箭头大小.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+5<17)
str=sprintf('%02d',i+8+5);%时间时为i，北京时为i+8，
title(['t=',str])
else
str=sprintf('%02d',i-16+5);%第二天了， i=24时，为北京时8时。 
title(['t=',str])
end
colormap(MPL_Blues);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 2]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','MM','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17)
    str=sprintf('%02d',i+8);
    suptitle(['RAIN-201801',sprintf('%02d',j)])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\RN-201801',sprintf('%02d',j),str])%%！！！！！！改改改！！！！！！！！
    else
    str=sprintf('%02d',i-16);
     suptitle(['RAIN-201801',sprintf('%02d',j+1)])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\RN-201801',sprintf('%02d',j+1),str])%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
    end
end


end
end
end