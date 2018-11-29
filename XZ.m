clear all;
ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');

% 画一天的风场日平均图1718的。
 j=1
%ncfile='I:\cmaqout\tianchunyan\20180101\METCRO2D.CN09GD_20180102'; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
%ncfile2='I:\cmaqout\tianchunyan\20180101\METDOT3D.CN09GD_20180102'
 ncfile='F:\graduate\毕业论文\数据\othersdata\cmaq\20171231\METCRO3D.CN09GD_20180101'; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
 ncfile2='F:\graduate\毕业论文\数据\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
U1=ncread(ncfile2,'UWIND');
U1=squeeze(U1(:,23,1:10,2));
V1=ncread(ncfile2,'VWIND');
V1=squeeze(V1(:,23,1:10,2));
WD1=ncread(ncfile,'QV');
WD1=squeeze(WD1(:,23,1:10,2));

nlon=squeeze(lonmodel1(:,23)); %将模式的经度读取出来，并存放在数组nlon中
nlon1=squeeze(lonmodel2(:,23));
nz=1:10;
[xx,zz]=meshgrid(nlon,nz); %将经度和垂直方向的数据赋值给[xx,zz].
[xx1,zz1]=meshgrid(nlon1,nz);
xx=xx';  %xx'将得到xx的数组转置
xx1=xx1'
zz1=zz1';
zz=zz';
load D:\matlab\MATLAB2014b\color11.mat;
%m_proj('mercator','lon',[112.85,114.2],'lat','23');  %创建一个自己设定经纬度范围的绘图投影区域
contourf(xx,zz,WD1,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量,32表示画的等值线的数目。
hold on;
quiver(xx1,zz1,U1,V1,0.5,'color','k');%以矢量箭头的方式画图，10是调节箭头长度.
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('20180101');

colormap(color11);
hc=colorbar; %色标
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围
%set(get(hc,'ylabel'),'String','m/s','fontsize',10);  % 对色标加单位
set(gca,'clim',[0.002 0.012]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','kg/kg','fontsize',10);  % 对色标加单位






%suptitle('20180102')
 print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\20180101'])%%！！！！！！改改改！！！！！！！！
