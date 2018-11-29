clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');

for k=01:25;  %用于读取不同的文件夹
for j=k+1 ;    %%！！！！！！改改改！！！！！！！！
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)];  %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
% 每个文件第一个时次是北京时09时，第24个时次是次日08时。
%AQ3(:,:,1,1)=0
temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,1));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,1));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,1));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,1));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR1=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,2));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,2));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,2));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,2));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI2=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR2=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,3));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,3));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,3));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,3));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI3=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR3=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,4));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,4));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,4));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,4));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI4=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR4=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,5));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,5));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,5));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,5));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI5=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR5=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,6));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,6));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,6));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,6));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI6=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR6=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,7));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,7));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,7));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,7));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI7=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR7=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,8));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,8));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,8));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,8));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI8=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR8=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,9));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,9));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,9));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,9));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI9=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR9=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,10));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,10));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,10));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,10));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI10=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR10=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,11));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,11));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,11));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,11));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI11=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR11=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,12));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,12));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,12));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,12));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI12=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR12=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,13));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,13));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,13));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,13));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI13=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR13=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,14));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,14));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,14));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,14));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI14=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR14=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,15));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,15));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,15));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,15));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI15=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR15=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,16));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,16));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,16));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,16));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI16=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR16=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,17));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,17));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,17));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,17));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI17=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR17=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,18));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,18));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,18));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,18));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI18=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR18=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,19));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,19));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,19));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,19));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI19=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR19=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,20));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,20));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,20));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,20));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI20=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR20=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,21));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,21));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,21));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,21));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI21=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR21=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,22));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,22));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,22));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,22));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI22=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR22=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,23));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,23));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,23));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,23));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI23=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR23=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,24));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,24));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,24));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,24));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (β(NO2) × C(NO2)) – 1] × 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (β(O3) × C(O3)) – 1] × 100% β(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (β(PM2.5) × C(PM2.5)) – 1] × 100%β(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (β(SO2) × C(SO2)) – 1] × 100% β(SO2) = 0.0001393235 
%AQHI24=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR24=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AQ2(:,:,1,j)=AR1+AR2+AR3+AR4+AR5+AR6+AR7+AR8+AR9+AR10+AR11+AR12+AR13+AR14+AR15+AR16;%第j天的世界时前16个时刻，北京时的9-24时
AQ3(:,:,1,j)=AR17+AR18+AR19+AR20+AR21+AR22+AR23+AR24;%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。
AQ(:,:,1,j)=(AQ2(:,:,1,j)+AQ3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，
AR=AQ(:,:,1,j);

AQA=AR;
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

tmpmean(1)=AQA(x1,y1);  %读取该格点的值
tmpmean(2)=AQA(x2,y2);
tmpmean(3)=AQA(x3,y3);
tmpmean(4)=AQA(x4,y4);
tmpmean(5)=AQA(x5,y5);
tmpmean(6)=AQA(x6,y6);
tmpmean(7)=AQA(x7,y7);
tmpmean(8)=AQA(x8,y8);
tmpmean(9)=AQA(x9,y9);
tmpmean(10)=AQA(x10,y10);
A(j,1)=mean(tmpmean); %对以上格点求平均值


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

AR1=AR;
AR1(find(AR1<0)) = 0;
AR1(find(AR1>=0&AR1<=3)) = 1;%将0-1.88范围内的点的值重新赋值为1。AR数组中的0-1.88范围内已经被改变为1，而其他的值不变。
AR1(find(AR1>3&AR1<=6)) =2; %在上面已经将1-1.88范围内的点赋值为1的基础上将1.88-3.76范围内的重新赋值为2.
AR1(find(AR1>6&AR1<=7)) = 3;
AR1(find(AR1>7&AR1<=10)) = 4;
AR1(find(AR1>10)) = 5;

[nx,ny]=size(lonmodel);%读取我现在所有的气象数据污染物浓度数据所对应的经纬度所对应的格点一共有多少个。（即X方向有多少个格点，Y方向有多少个格点。）

load('F:\graduate\毕业论文\数据\landscan\npop.mat'); %读取我的mat文件

%%%%%% A*B(A和B矩阵按照线代的方法矩阵相乘) A.*B(A和B的矩阵，两个矩阵对应点的点相乘）

npop(find(npop<0)) = 0;
npop(find(npop>0&npop<=10)) = 1;  %将0-1.88范围内的点的值重新赋值为1。AR数组中的0-1.88范围内已经被改变为1，而其他的值不变。
npop(find(npop>10&npop<=50)) =2;  %在上面已经将1-1.88范围内的点赋值为1的基础上将1.88-3.76范围内的重新赋值为2.
npop(find(npop>50&npop<=100)) = 3;
npop(find(npop>100&npop<=200)) = 4;
npop(find(npop>200&npop<=500)) = 5;
npop(find(npop>500&npop<=1000)) = 6;
npop(find(npop>1000&npop<=1500)) = 7;
npop(find(npop>1500&npop<=2000)) = 8;
npop(find(npop>2000&npop<=5000)) = 9;
npop(find(npop>5000&npop<=10000)) = 10;
npop(find(npop>1000)) = 11;

D=sqrt(AR.*npop); %%%%B=sqrt(A)对矩阵中的每个元素求平方根(A=B.*B)，B=sqrtm(A)是对矩阵求平方根（A=B*B）

AR1;
load D:\matlab\MATLAB2014b\color13.mat
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,AR1,32,'linestyle','none');%使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title(['AQHI201801',sprintf('%02d',j)])
colormap(color13);
%hc=colorbar; %色标
hc=colorbar('YTickLabel',{'0','L','M','H','VH','S'}); %色标用不同的文字来表示色标
caxis([0,5]);
hc.Ticks = 0:5;%11个刻度。
%hc.TickLabels=[0,1.88,3.76,5.64,7.52,9.41,11.29,12.91,15.07,17.22,19.37 20];% 自定义色标的值。和颜色不对应，和实际值不对应。
%set(gca,'clim',[0 5]);  %设定绘图要素的取值范围
%set(get(hc,'ylabel'),'String','fontsize',10);  % 对色标加单位

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%保存图像。
% print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\AR2-201801',sprintf('%02d',j)]);%%！！！！！！改改改！！！！！！！！
end  
end
A
A(find(A<0)) = 0;
A(find(A>0&A<=1.88)) = 1;
A(find(A>1.88&A<=3.76)) =2;
A(find(A>3.76&A<=5.64)) = 3;
A(find(A>5.64&A<=7.52)) = 4;
A(find(A>7.52&A<=9.41)) = 5;
A(find(A>9.41&A<=11.29)) = 6;
A(find(A>11.29&A<=12.91)) = 7;
A(find(A>12.91&A<=15.07)) = 8;
A(find(A>15.07&A<=17.22)) = 9;
A(find(A>17.22&A<=19.37)) = 10;
A(find(A>19.37)) = 11;
A