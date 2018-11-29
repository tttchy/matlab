clear all;
ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');

%画1号2号的标量气象场
 j=1;
 rsum(102,81,1,25)=0;
% subplot(2,2,1);%将图形窗口分割成 m行n列,并设置p所指定的子窗口为当前窗口。子窗口按行由左至右，由上至下进行编号。这一命令在M AT L A B的当前版本中也被写作s u b p l o t ( m n p )。
 ncfile='I:\cmaqout\tianchunyan\20180101\CONC.CN09GD_20180102'; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
 %ncfile='F:\graduate\毕业论文\数据\othersdata\cmaq\20171231\CONC.CN09GD_20180101'; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
for i=1:16;
T1=ncread(ncfile,'NO2');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%第j天的世界时前16个时刻，北京时的9-24时

   %ncfile='F:\graduate\毕业论文\数据\othersdata\cmaq\20171230\CONC.CN09GD_20171231'; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
   ncfile='F:\graduate\毕业论文\数据\othersdata\cmaq\20171231\CONC.CN09GD_20180101'; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'NO2');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j))/24;  %%%AQ英语计算北京时的日平均。%出现超出索引的问题，因为j-1忘记改为j了。

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
A(1)=mean(tmpmean)  %对以上格点求平均值




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load D:\matlab\MATLAB2014b\CBR_coldhot.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('NO2-20180102');  %绘图上的标题
colormap(CBR_coldhot);
hc=colorbar; %色标
set(gca,'clim',[10 120]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
%print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAVENO2-20180102'])%%！！！！！！改改改！！！！！！！！
