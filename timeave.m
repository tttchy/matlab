clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');
% 读进去其中一天的污染物数据

for k=01:25  %用于读取不同的文件夹
for j=k+1     %%！！！！！！改改改！！！！！！！！
    ncfile1=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)] %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]

subplot(2,2,1); %将图形窗口分割成 m行n列,并设置p所指定的子窗口为当前窗口。子窗口按行由左至右，由上至下进行编号。这一命令在M AT L A B的当前版本中也被写作s u b p l o t ( m n p )。  
for i=1:24 % 每个文件第一个时次是北京时09时，第24个时次是次日08时。
temp10=ncread(ncfile1,'Q2');
temp1(:,:,1,i)=squeeze(temp10(:,:,1,i));
end
load D:\matlab\MATLAB2014b\color3.mat
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,mean(temp1),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('Q2');  %绘图上的标题
colormap(color3);
hc=colorbar; %色标
set(gca,'clim',[0.003 0.012]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','kg/kg','fontsize',10);  % 对色标加单位


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2);
for i=1:24
temp20=ncread(ncfile1,'PBL');
temp2(:,:,1,i)=squeeze(temp20(:,:,1,i));
end
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,mean(temp2),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('PBL');  %绘图上的标题
hc=colorbar; %色标
set(gca,'clim',[0 1100]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','m','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3);
for i=1:24
temp30=ncread(ncfile1,'TEMP2');
temp3(:,:,1,i)=squeeze(temp30(:,:,1,i));
end 
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,mean(temp3)-273.15,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('TEMP2');  %绘图上的标题
hc=colorbar; %色标
set(gca,'clim',[10 23]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','℃','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,2,4);
%temp=ncread(ncfile1,'PRSFC');
%temp=squeeze(temp(:,:,1,i));
%m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
%m_contourf(lonmodel1,latmodel1,temp/100,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
%m_grid; 
%title('PRSFC');  %绘图上的标题
%hc=colorbar; %色标
%set(gca,'clim',[985 1025]);  %设定绘图要素的取值范围
%set(get(hc,'ylabel'),'String','hPa','fontsize',10);  % 对色标加单位
for i=1:24
U0=ncread(ncfile2,'UWIND');
V0=ncread(ncfile2,'VWIND');
temp40=ncread(ncfile1,'WSPD10');
U(:,:,1,i)=squeeze(U0(:,:,7,i));
V(:,:,1,i)=squeeze(V0(:,:,7,i));
temp4(:,:,1,i)=squeeze(temp40(:,:,1,i));
end 
load D:\matlab\MATLAB2014b\color3.mat
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,mean(temp4),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
hold on
m_quiver(lonmodel2,latmodel2,mean(U),mean(V),10,'color','k');%以矢量箭头的方式画图，24是调节箭头大小.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('wind10');

colormap(color3);
hc=colorbar; %色标
set(gca,'clim',[0 8]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','m/s','fontsize',10);  % 对色标加单位




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17)
    str=sprintf('%02d',i+8);
    suptitle(['201801',sprintf('%02d',j)])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\ave201801',sprintf('%02d',j)]); %%！！！！！！改改改！！！！！！！！
    else
    str=sprintf('%02d',i-16);
     suptitle(['201801',sprintf('%02d',j+1)])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\ave201801',sprintf('%02d',j+1)]);%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
    end
end
if(j==k+2)
   if(i<17)
   str=sprintf('%02d',i+8);
   suptitle(['201801',sprintf('%02d',j)])  %给分块矩阵加总标题
   print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第2天\201801',sprintf('%02d',j)]); %%！！！！！！改改改！！！！！！！！
   else
   str=sprintf('%02d',i-16);
   suptitle(['201801',sprintf('%02d',j+1)])  %给分块矩阵加总标题
   print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第2天\201801',sprintf('%02d',j+1)]);%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
   end
end
if(j==k+3)
   if(i<17)
   str=sprintf('%02d',i+8);
   suptitle(['201801',sprintf('%02d',j-31)])  %给分块矩阵加总标题
   print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第3天\201801',sprintf('%02d',j)]); %%！！！！！！改改改！！！！！！！！
   else
   str=sprintf('%02d',i-16);
   suptitle(['201801',sprintf('%02d',j+1-31)])  %给分块矩阵加总标题
   print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第3天\201801',sprintf('%02d',j+1)]);%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
   end    
end

end
end