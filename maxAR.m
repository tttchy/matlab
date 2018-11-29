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
Q=0;
% 读进去其中一天的污染物数据
for k=01:25 ; %用于读取不同的文件夹
for j=k+1 ;    %%！！！！！！改改改！！！！！！！！
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)] ; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
for i=1:24;% 每个文件第一个时次是北京时09时，第24个时次是次日08时。

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

AR=ARNO2+ARO3+ARPM25+ARSO2;

D=max(max(AR))%一个二维矩阵中取最大值后。
if(D>Q)
Q=D
end

xlswrite('F:\graduate\毕业论文\数据\picture\maxAR.xls',Q,'sheet1')%'A:C'表示保存在A和C列单元格中，并占满。







end
end
end
Q