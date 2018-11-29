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
%画广州算法的AQHI的逐时图，每6个小时画于一张图上，与aqhi66的差别在与变量名改变了，但是效果是一样的。
for k=15  %用于读取不同的文件夹
for j=k+1     %%！！！！！！改改改！！！！！！！！
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]  %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
i=23
subplot(2,3,1);
temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,i));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,i));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,i));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,i));

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%对AR进行复制，以进行画图的时候和色标是对应的。
AR(find(AR<0)) = 0;
AR(find(AR>0&AR<=1.88)) = 1;
AR(find(AR>1.88&AR<=3.76)) =2;
AR(find(AR>3.76&AR<=5.64)) = 3;
AR(find(AR>5.64&AR<=7.52)) = 4;
AR(find(AR>7.52&AR<=9.41)) = 5;
AR(find(AR>9.41&AR<=11.29)) = 6;
AR(find(AR>11.29&AR<=12.91)) = 7;
AR(find(AR>12.91&AR<=15.07)) = 8;
AR(find(AR>15.07&AR<=17.22)) = 9;
AR(find(AR>17.22&AR<=19.37)) = 10;
AR(find(AR>19.37)) = 11;
load D:\matlab\MATLAB2014b\color12.mat
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
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
colormap(color12);
%hc=colorbar; %色标
caxis([0,11])
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,2);
temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,i+1));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,i+1));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,i+1));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,i+1));

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%对AR进行复制，以进行画图的时候和色标是对应的。
AR(find(AR<0)) = 0;
AR(find(AR>0&AR<=1.88)) = 1;
AR(find(AR>1.88&AR<=3.76)) =2;
AR(find(AR>3.76&AR<=5.64)) = 3;
AR(find(AR>5.64&AR<=7.52)) = 4;
AR(find(AR>7.52&AR<=9.41)) = 5;
AR(find(AR>9.41&AR<=11.29)) = 6;
AR(find(AR>11.29&AR<=12.91)) = 7;
AR(find(AR>12.91&AR<=15.07)) = 8;
AR(find(AR>15.07&AR<=17.22)) = 9;
AR(find(AR>17.22&AR<=19.37)) = 10;
AR(find(AR>19.37)) = 11;
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
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
colormap(color12);
%hc=colorbar; %色标
caxis([0,11]);%设定色标的颜色对应值得范围为0-11之间。大于11的将射到11上，与实际值对应。
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
for k=16 %用于读取不同的文件夹
for j=k+1     %%！！！！！！改改改！！！！！！！！
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]  %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
i=1
subplot(2,3,3);
temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,i));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,i));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,i));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,i));

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%对AR进行复制，以进行画图的时候和色标是对应的。
AR(find(AR<0)) = 0;
AR(find(AR>0&AR<=1.88)) = 1;
AR(find(AR>1.88&AR<=3.76)) =2;
AR(find(AR>3.76&AR<=5.64)) = 3;
AR(find(AR>5.64&AR<=7.52)) = 4;
AR(find(AR>7.52&AR<=9.41)) = 5;
AR(find(AR>9.41&AR<=11.29)) = 6;
AR(find(AR>11.29&AR<=12.91)) = 7;
AR(find(AR>12.91&AR<=15.07)) = 8;
AR(find(AR>15.07&AR<=17.22)) = 9;
AR(find(AR>17.22&AR<=19.37)) = 10;
AR(find(AR>19.37)) = 11;
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
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
colormap(color12);
%hc=colorbar; %色标
caxis([0,11]);%设定色标的颜色对应值得范围为0-11之间。大于11的将射到11上，与实际值对应。
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,4);
temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,i+1));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,i+1));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,i+1));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,i+1));

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%对AR进行复制，以进行画图的时候和色标是对应的。
AR(find(AR<0)) = 0;
AR(find(AR>0&AR<=1.88)) = 1;
AR(find(AR>1.88&AR<=3.76)) =2;
AR(find(AR>3.76&AR<=5.64)) = 3;
AR(find(AR>5.64&AR<=7.52)) = 4;
AR(find(AR>7.52&AR<=9.41)) = 5;
AR(find(AR>9.41&AR<=11.29)) = 6;
AR(find(AR>11.29&AR<=12.91)) = 7;
AR(find(AR>12.91&AR<=15.07)) = 8;
AR(find(AR>15.07&AR<=17.22)) = 9;
AR(find(AR>17.22&AR<=19.37)) = 10;
AR(find(AR>19.37)) = 11;
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
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
colormap(color12);
%hc=colorbar; %色标
caxis([0,11]);%设定色标的颜色对应值得范围为0-11之间。大于11的将射到11上，与实际值对应。
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5);
temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,i+2));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,i+2));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,i+2));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,i+2));

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%对AR进行复制，以进行画图的时候和色标是对应的。
AR(find(AR<0)) = 0;
AR(find(AR>0&AR<=1.88)) = 1;
AR(find(AR>1.88&AR<=3.76)) =2;
AR(find(AR>3.76&AR<=5.64)) = 3;
AR(find(AR>5.64&AR<=7.52)) = 4;
AR(find(AR>7.52&AR<=9.41)) = 5;
AR(find(AR>9.41&AR<=11.29)) = 6;
AR(find(AR>11.29&AR<=12.91)) = 7;
AR(find(AR>12.91&AR<=15.07)) = 8;
AR(find(AR>15.07&AR<=17.22)) = 9;
AR(find(AR>17.22&AR<=19.37)) = 10;
AR(find(AR>19.37)) = 11;
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+2<17)
str=sprintf('%02d',i+8+2);%时间时为i，北京时为i+8，
title(['t=',str])
else
str=sprintf('%02d',i-16+2);%第二天了， i=24时，为北京时8时。 
title(['t=',str])
end
colormap(color12);
%hc=colorbar; %色标
caxis([0,11]);%设定色标的颜色对应值得范围为0-11之间。大于11的将射到11上，与实际值对应。
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,6);


temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,i+3));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,i+3));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,i+3));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,i+3));

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%对AR进行复制，以进行画图的时候和色标是对应的。
AR(find(AR<0)) = 0;
AR(find(AR>0&AR<=1.88)) = 1;
AR(find(AR>1.88&AR<=3.76)) =2;
AR(find(AR>3.76&AR<=5.64)) = 3;
AR(find(AR>5.64&AR<=7.52)) = 4;
AR(find(AR>7.52&AR<=9.41)) = 5;
AR(find(AR>9.41&AR<=11.29)) = 6;
AR(find(AR>11.29&AR<=12.91)) = 7;
AR(find(AR>12.91&AR<=15.07)) = 8;
AR(find(AR>15.07&AR<=17.22)) = 9;
AR(find(AR>17.22&AR<=19.37)) = 10;
AR(find(AR>19.37)) = 11;
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
if(i+3<17)
str=sprintf('%02d',i+8+3);%时间时为i，北京时为i+8，
title(['t=',str])
else
str=sprintf('%02d',i-16+3);%第二天了， i=24时，为北京时8时。 
title(['t=',str])
end
colormap(color12);
%hc=colorbar; %色标
hc=colorbar('position',[0.909 0.2 0.02 0.6]) 
caxis([0,11]);%设定色标的颜色对应值得范围为0-11之间。大于11的将射到11上，与实际值对应。
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17)
    str=sprintf('%02d',i+8);
    suptitle(['AQHI201801',sprintf('%02d',j)])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\AQHI201801',sprintf('%02d',j),str])%%！！！！！！改改改！！！！！！！！
    else
    str=sprintf('%02d',i-16);
     suptitle(['AQHI201801',sprintf('%02d',j+1)])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\AQHI201801',sprintf('%02d',j+1),str])%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
    end
end


end
end
