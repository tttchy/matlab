clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel=ncread(ncfilelocat1,'LAT');



load('F:\graduate\毕业论文\数据\npop.mat')
load('F:\graduate\毕业论文\数据\ARX.mat')
load('F:\graduate\毕业论文\数据\AR.mat')
ARX
max(max(ARX))
min(min(ARX))

[x1,y1]=findpoint(113.235,23.1422,lonmodel,latmodel); %读取对应经纬度的格点数据
[x2,y2]=findpoint(113.261,23.105,lonmodel,latmodel);
[x3,y3]=findpoint(113.348,23.0916,lonmodel,latmodel);
[x4,y4]=findpoint(113.433,23.105,lonmodel,latmodel);
[x5,y5]=findpoint(113.352,22.9477,lonmodel,latmodel);
[x6,y6]=findpoint(113.215,23.3917,lonmodel,latmodel);
[x7,y7]=findpoint(113.26,23.1331,lonmodel,latmodel);
[x8,y8]=findpoint(113.568,23.2783,lonmodel,latmodel);
[x9,y9]=findpoint(113.281,23.1569,lonmodel,latmodel);
[x10,y10]=findpoint(113.589,23.5538,lonmodel,latmodel);

tmpmean(1)=ARX(x1,y1);  %读取该格点的值
tmpmean(2)=ARX(x2,y2);
tmpmean(3)=ARX(x3,y3);
tmpmean(4)=ARX(x4,y4);
tmpmean(5)=ARX(x5,y5);
tmpmean(6)=ARX(x6,y6);
tmpmean(7)=ARX(x7,y7);
tmpmean(8)=ARX(x8,y8);
tmpmean(9)=ARX(x9,y9);
tmpmean(10)=ARX(x10,y10);
A(1)=mean(tmpmean);%对以上格点求平均值
A
%load D:\matlab\MATLAB2014b\color13.mat

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,ARX,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('AQHI20180124')
%colormap(color13);
hc=colorbar
%set(gca,'clim',[0 4])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%保存图像。
 %print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\AR2-20180124'])%%！！！！！！改改改！！！！！！！！

