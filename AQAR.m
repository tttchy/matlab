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
%  画两种算法的AQHI图的对比图。
for k=01 %用于读取不同的文件夹
for j=k+1     %%！！！！！！改改改！！！！！！！！
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]  %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
for i=1:24% 每个文件第一个时次是北京时09时，第24个时次是次日08时。
subplot(1,2,1);
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

AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304
AR=ARNO2+ARO3+ARPM25+ARSO2


load D:\matlab\MATLAB2014b\color12.mat
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AQHI1,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
set(gca,'FontSize',8);%只能同时改变x y轴显示的字体大小；
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('AQHI');  %绘图上的标题
colormap(color12);
hc=colorbar; %色标
caxis([0,11]);%设定色标的颜色对应值得范围为0-11之间。大于11的将射到11上，与实际值对应。
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围
%set(get(hc,'ylabel'),'String','μg m^-^3','fontsize',10);  % 对色标加单位

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(1,2,2);
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
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ; 
%AR=ARNO2+ARO3+ARPM25
AQHI1=((ARNO2+ARO3+ARPM25)*10)/26.6304
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
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AR,32','linestyle','none');   %使用填色图的形式画dispvar这个变量
set(gca,'FontSize',7);%只能同时改变x y轴显示的字体大小；
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('%AR');  %绘图上的标题
colormap(color12);
hc=colorbar; %色标
caxis([0,11])
hc.Ticks = 0:11;%11个刻度。
hc.TickLabels=[0,1.88,3.76,5.64,7.52,9.41,11.29,12.91,15.07,17.22,19.37 20];% 自定义色标的值。和颜色不对应，和实际值不对应。
%set(gca,'clim',[0 20]);  %设定绘图要素的取值范围
%set(get(hc,'ylabel'),'String','μg m^-^3','fontsize',10);  % 对色标加单位

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17)
    str=sprintf('%02d',i+8);
    suptitle(['201801',sprintf('%02d',j),'/',str])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\1aqhi201801',sprintf('%02d',j),str]); %%！！！！！！改改改！！！！！！！！
    else
    str=sprintf('%02d',i-16);
     suptitle(['201801',sprintf('%02d',j+1),'/',str])  %给分块矩阵加总标题
    print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\1aqhi201801',sprintf('%02d',j+1),str]);%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
    end
end
if(j==k+2)
   if(i<17)
   str=sprintf('%02d',i+8);
   suptitle(['201801',sprintf('%02d',j),'/',str])  %给分块矩阵加总标题
   print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第2天\201801',sprintf('%02d',j),str]); %%！！！！！！改改改！！！！！！！！
   else
   str=sprintf('%02d',i-16);
   suptitle(['201801',sprintf('%02d',j+1),'/',str])  %给分块矩阵加总标题
   print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第2天\201801',sprintf('%02d',j+1),str]);%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
   end
end
if(j==k+3)
   if(i<17)
   str=sprintf('%02d',i+8);
   suptitle(['201801',sprintf('%02d',j-31),'/',str])  %给分块矩阵加总标题
   print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第3天\201801',sprintf('%02d',j-31),str]); %%！！！！！！改改改！！！！！！！！
   else
   str=sprintf('%02d',i-16);
   suptitle(['201801',sprintf('%02d',j+1-31),'/',str])  %给分块矩阵加总标题
   print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第3天\201801',sprintf('%02d',j+1-31),str]);%保存到不同的文件加下 %%！！！！！！改改改！！！！！！！！
   end    
end

end
end
end