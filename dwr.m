
clear all;

ncfilelocat='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
lonmodel=ncread(ncfilelocat,'LON');
latmodel=ncread(ncfilelocat,'LAT');
% 读进去其中一天的污染物数据，将四种污染物画在同一张图上，一个月的。
for k=01:25  %用于读取不同的文件夹
for j=k+1:k+3     %%！！！！！！改改改！！！！！！！！
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)] %读不同文件下的不同文件%！！！！改改改！！！！！！！！
for i=1:24 % 每个文件第一个时次是北京时09时，第24个时次是次日08时。

subplot(2,2,1);%将图形窗口分割成 m行n列,并设置p所指定的子窗口为当前窗口。子窗口按行由左至右，由上至下进行编号。这一命令在M AT L A B的当前版本中也被写作s u b p l o t ( m n p )。
temp=ncread(ncfile,'PM25');
temp=squeeze(temp(:,:,1,i));
load D:\matlab\MATLAB2014b\color3.mat
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,temp,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('PM2.5');  %绘图上的标题
colormap(color3);
hc=colorbar; %色标
set(gca,'clim',[0 200]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','μg m^-^3','fontsize',10);  % 对色标加单位


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2);
temp=ncread(ncfile,'SO2');
temp=squeeze(temp(:,:,1,i));
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,temp,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('SO2');  %绘图上的标题
hc=colorbar; %色标
%set(gca,'clim',[0 200]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','μg m^-^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3);
temp=ncread(ncfile,'O3');
temp=squeeze(temp(:,:,1,i));
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,temp,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('O3');  %绘图上的标题
hc=colorbar; %色标
%set(gca,'clim',[0 100]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','μg m^-^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,2,4);
temp=ncread(ncfile,'NO2');
temp=squeeze(temp(:,:,1,i));
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,temp,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 

title('NO2')
hc=colorbar; %色标
%set(gca,'clim',[0 150]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','μg m^-^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(i<17)
str=sprintf('%02d',i+8);
suptitle(['201801',sprintf('%02d',j),'/',str])  %给分块矩阵加总标题
print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\201801',sprintf('%02d',k),'\201801',sprintf('%02d',j),str]); %%！！！！！！改改改！！！！！！！！
else
str=sprintf('%02d',i-16);
suptitle(['201801',sprintf('%02d',j+1),'/',str])  %给分块矩阵加总标题
print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\201801',sprintf('%02d',k),'\201801',sprintf('%02d',j+1),str]);%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
end

end
end
end



