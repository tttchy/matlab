clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');

% 读进去其中一天的污染物数据
%通过改变标量可以画风场图和水汽输送图。
m=7;
n=19
usum(1:n,1:m,1)=0;%%sum(46:64,1,1),矩阵的最大维数是sum(64,1,1).
vsum(1:n,1:m,1)=0;
wsum(1:n,1:m,1)=0;

for k=01:25;  %用于读取不同的文件夹
for j=k+1 ;   %%！！！！！！改改改！！！！！！！！
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO3D.CN09GD_201801',sprintf('%02d',j)]; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];

for i=1:16;
U1=ncread(ncfile2,'UWIND');
U1=squeeze(U1(46:64,44,1:m,i)); %读出的U1为19×10single的两维数组。
usum(1:n,1:m,i+1)=U1+usum(1:n,1:m,i);
end
uwind2(1:n,1:m,j)=usum(1:n,1:m,17);%第j天的世界时前16个时刻，北京时的9-24时

usum(1:n,1:m,17)=0;
for i=17:24;
U2=ncread(ncfile2,'UWIND');
U2=squeeze(U2(46:64,44,1:m,i));
usum(1:n,1:m,i+1)=U1+usum(1:n,1:m,i);
end
uwind3(1:n,1:m,j)=usum(1:n,1:m,25);%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。

for i=1:16;
V1=ncread(ncfile2,'VWIND');
V1=squeeze(V1(46:64,44,1:m,i));
vsum(1:n,1:m,i+1)=V1+vsum(1:n,1:m,i);
end
vwind2(1:n,1:m,j)=vsum(1:n,1:m,17);%第j天的世界时前16个时刻，北京时的9-24时
vsum(1:n,1:m,17)=0;
for i=17:24;
V2=ncread(ncfile2,'VWIND');
V2=squeeze(V2(46:64,44,1:m,i));
vsum(1:n,1:m,i+1)=V2+vsum(1:n,1:m,i);
end
vwind3(1:n,1:m,j)=vsum(1:n,1:m,25);%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。

uwind1(1:n,1:m,j)=(uwind2(1:n,1:m,j)+uwind3(1:n,1:m,j-1));  %%%AQ英语计算北京时的日平均，
vwind1(1:n,1:m,j)=(vwind2(1:n,1:m,j)+vwind3(1:n,1:m,j-1));  %%%AQ英语计算北京时的日平均，
wind2(1:n,1:m,j)=uwind1(1:n,1:m,j).*uwind1(1:n,1:m,j);
wind3(1:n,1:m,j)=vwind1(1:n,1:m,j).*vwind1(1:n,1:m,j);
wind1(1:n,1:m,j)=(sqrt(wind2(1:n,1:m,j)+wind3(1:n,1:m,j)))/24;  %%%AQ英语计算北京时的日平均，

ws=wind1(1:n,1:m,j);
uw=uwind1(1:n,1:m,j)/24;
vw=vwind1(1:n,1:m,j)/24

nlon=squeeze(lonmodel1(46:64,44)); %将模式的经度读取出来，并存放在数组nlon中
nlon1=squeeze(lonmodel2(46:64,44));
nz=1:m;
[xx,zz]=meshgrid(nlon,nz); %将经度和垂直方向的数据以格点的形式赋值给[xx,zz].
[xx1,zz1]=meshgrid(nlon1,nz);
xx=xx';  %xx'将得到xx的数组转置
xx1=xx1';
zz1=zz1';
zz=zz';



load D:\matlab\MATLAB2014b\color11.mat;

%m_proj('mercator','lon',[112.85,114.2],'lat','23');  %创建一个自己设定经纬度范围的绘图投影区域
contourf(xx,zz,ws,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量,32表示画的等值线的数目。
hold on;
plot([113.3 113.3],[0 7],'r'); %画一条垂直于x轴的直线。
%hold off;
quiver(xx1,zz1,uw,vw,0.25,'color','k');%以矢量箭头的方式画图，10是调节箭头长度.
hold off;
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title(['W-lon201801',sprintf('%02d',j)]);
colormap(color11);
hc=colorbar; %色标
set(gca,'clim',[0 10]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','m/s','fontsize',10);  % 对色标加单位
%set(get(hc,'xtick'),'String','纬度','fontsize',10);  % 对色标加单位
xlabel('Lon(°)');%给x坐标加标题。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAVEuvlon-201801',sprintf('%02d',j)]);%输出到文件夹下。

end
end