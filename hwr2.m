clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel=ncread(ncfilelocat1,'LAT');

A=zeros(24,1);
B=zeros(24,1);
C=zeros(24,1);
% 读进去其中一天的污染物数据,读取逐时的气象资料，每张页面画6个时刻的。两个不同文件夹下的拼接。

for k=15; %用于读取不同的文件夹
for j=k+1 ;    %%！！！！！！改改改！！！！！！！！
 ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)] ;%;读不同文件下的不同文件%！！！！改改改！！！！！！！！
i=23;
subplot(2,3,1);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i));

load D:\matlab\MATLAB2014b\CBR_coldhot.mat;
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i<17)
str=sprintf('%02d',i+8);%时间时为i，北京时为i+8，
title(['t=',str])
else
str=sprintf('%02d',i-16);%第二天了， i=24时，为北京时8时。 
title(['t=',str])
end
colormap(CBR_coldhot);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,2);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i+1));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+1<17)
str=sprintf('%02d',i+8+1);%时间时为i，北京时为i+8，
title(['t=',str])
else
str=sprintf('%02d',i-16+1);%第二天了， i=24时，为北京时8时。 
title(['t=',str])
end
colormap(CBR_coldhot);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

end
end

for k=16; %用于读取不同的文件夹
for j=k+1 ;    %%！！！！！！改改改！！！！！！！！
 ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)] ;%读不同文件下的不同文件%！！！！改改改！！！！！！！！
i=1;
subplot(2,3,3);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+2<17)
str=sprintf('%02d',i+8);%时间时为i，北京时为i+8，
title(['t=',str]);
else
str=sprintf('%02d',i-16);%第二天了， i=24时，为北京时8时。 
title(['t=',str]);
end
colormap(CBR_coldhot);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,4);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i+1));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+1<17)
str=sprintf('%02d',i+8+1);%时间时为i，北京时为i+8，
title(['t=',str]);
else
str=sprintf('%02d',i-16+1);%第二天了， i=24时，为北京时8时。 
title(['t=',str]);
end

colormap(CBR_coldhot);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i+2));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
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
colormap(CBR_coldhot);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,6);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i+3));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
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
colormap(CBR_coldhot);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]);
set(gca,'clim',[10 120]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % 对色标加单位
%annotation('arrow',[0.9 0.95],[0.1 0.1
%quiver(0.9,0.1,0.1,0.1) %画一个矢量箭头
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1);
    if(i<17);
    str=sprintf('%02d',i+8);
    suptitle(['PM2.5-201801',sprintf('%02d',j)])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\PM25-201801',sprintf('%02d',j),str])%%！！！！！！改改改！！！！！！！！
    else
    str=sprintf('%02d',i-16);
     suptitle(['PM2.5-201801',sprintf('%02d',j+1)])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\PM25-201801',sprintf('%02d',j+1),str])%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
    end
end



end
end