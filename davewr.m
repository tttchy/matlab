clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');
% 读进去其中一天的污染物数据
%画气象要素的标量
psum(102,81,1,25)=0;
vsum(102,81,1,25)=0;
rsum(102,81,1,25)=0;
for k=1:25 %用于读取不同的文件夹
   % subplot(3,4,k-12); 分块
for j=k+1 ;   %%！！！！！！改改改！！！！！！！！
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
%%%%%%%%%%%%%%%%%%%%画污染物

for i=1:16;
T1=ncread(ncfile,'NO2');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%第j天的世界时前16个时刻，北京时的9-24时

rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'NO2');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均。

AR=wind1(:,:,1,j);
[x1,y1]=findpoint(113.235,23.1422,lonmodel1,latmodel1); %读取对应经纬度的格点数据
[x2,y2]=findpoint(113.261,23.105,lonmodel1,latmodel1);
[x3,y3]=findpoint(113.348,23.0916,lonmodel1,latmodel1);
[x4,y4]=findpoint(113.433,23.105,lonmodel1,latmodel1);
[x5,y5]=findpoint(113.352,22.9477,lonmodel1,latmodel1);
[x6,y6]=findpoint(113.215,23.3917,lonmodel1,latmodel1);
[x7,y7]=findpoint(113.26,23.1331,lonmodel1,latmodel1);
[x8,y8]=findpoint(113.568,23.2783,lonmodel1,latmodel1);
[x9,y9]=findpoint(113.281,23.1569,lonmodel1,latmodel1);
[x10,y10]=findpoint(113.589,23.5538,lonmodel1,latmodel1);

tmpmean(1)=AR(x1,y1);  %读取该格点的值
tmpmean(2)=AR(x2,y2);
tmpmean(3)=AR(x3,y3);
tmpmean(4)=AR(x4,y4);
tmpmean(5)=AR(x5,y5);
tmpmean(6)=AR(x6,y6);
tmpmean(7)=AR(x7,y7);
tmpmean(8)=AR(x8,y8);
tmpmean(9)=AR(x9,y9);
tmpmean(10)=AR(x10,y10);
A(j,1)=mean(tmpmean); %对以上格点求平均值


load D:\matlab\MATLAB2014b\CBR_coldhot.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量

%set(gca,'FontSize',5);%只能同时改变x y轴显示的字体大小；
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title(['NO2-201801',sprintf('%02d',j)]);  %绘图上的标题
colormap(CBR_coldhot);
hc=colorbar; %色标
%caxis([10 120]);%设定色标的颜色对应值得范围为0-11之间。大于11的将射到11上，与实际值对应。
set(gca,'clim',[10 120]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % 对色标加单位
%print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAVENO2-201801',sprintf('%02d',j)]);%输出到文件夹下。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
end

%hc=colorbar('position',[0.909 0.2 0.02 0.6]) 
%set(get(hc,'ylabel'),'String','hPa','fontsize',10);  % 对色标加单位
%print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAVEPRSFC-201801-2']);%输出到文件夹下。
