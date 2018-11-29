clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');

% ����ȥ����һ�����Ⱦ������
%��20180101�յ�AQHI���˿ڷּ�ͼ�����ߵ��ӵ�ͼ������۵ķ�����
 ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\CONC.CN09GD_20180101';%����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 %ncfile='I:\cmaqout\tianchunyan\20180101\CONC.CN09GD_20180102';
 pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,1));
ooo1=ncread(ncfile,'O3');
ooo1=squeeze(ooo1(:,:,1,1));
no1=ncread(ncfile,'NO2');
no1=squeeze(no1(:,:,1,1));
so1=ncread(ncfile,'SO2');
so1=squeeze(so1(:,:,1,1));
ARNO2=100*(exp(0.0004462559*no1)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo1)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so1/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR1=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm2=ncread(ncfile,'PM25');
pm2=squeeze(pm2(:,:,1,2));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,2));
no2=ncread(ncfile,'NO2');
no2=squeeze(no2(:,:,1,2));
so2=ncread(ncfile,'SO2');
so2=squeeze(so2(:,:,1,2));
ARNO2=100*(exp(0.0004462559*no2)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm2)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so2/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI2=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR2=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm3=ncread(ncfile,'PM25');
pm3=squeeze(pm3(:,:,1,3));
ooo3=ncread(ncfile,'O3');
ooo3=squeeze(ooo3(:,:,1,3));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,3));
so3=ncread(ncfile,'SO2');
so3=squeeze(so3(:,:,1,3));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo3)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm3)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so3/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI3=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR3=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,4));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,4));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,4));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,4));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI4=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR4=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,5));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,5));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,5));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,5));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI5=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR5=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,6));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,6));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,6));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,6));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI6=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR6=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,7));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,7));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,7));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,7));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI7=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR7=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,8));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,8));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,8));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,8));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI8=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR8=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,9));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,9));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,9));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,9));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI9=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR9=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,10));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,10));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,10));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,10));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI10=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR10=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,11));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,11));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,11));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,11));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI11=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR11=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,12));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,12));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,12));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,12));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI12=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR12=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,13));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,13));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,13));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,13));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI13=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR13=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,14));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,14));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,14));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,14));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI14=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR14=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,15));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,15));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,15));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,15));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI15=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR15=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,16));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,16));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,16));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,16));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI16=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR16=ARNO2+ARO3+ARPM25+ARSO2;
AQ2(:,:,1,1)=AR1+AR2+AR3+AR4+AR5+AR6+AR7+AR8+AR9+AR10+AR11+AR12+AR13+AR14+AR15+AR16;%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\CONC.CN09GD_20171231'; %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
%ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\CONC.CN09GD_20180101'; %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
 %ncfile='I:\cmaqout\tianchunyan\20180122\CONC.CN09GD_20180123';
% ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��
pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,17));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,17));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,17));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,17));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI17=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367
AR17=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,18));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,18));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,18));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,18));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI18=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR18=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,19));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,19));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,19));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,19));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI19=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR19=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,20));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,20));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,20));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,20));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI20=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR20=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,21));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,21));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,21));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,21));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI21=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR21=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,22));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,22));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,22));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,22));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI22=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR22=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,23));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,23));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,23));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,23));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI23=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR23=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,24));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,24));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,24));
so4=ncread(ncfile,'SO2');
so4=squeeze(so4(:,:,1,24));
ARNO2=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(so4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI24=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR24=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AQ1=(AQHI1+AQHI2+AQHI3+AQHI4+AQHI5+AQHI6+AQHI7+AQHI8+AQHI9+AQHI10+AQHI11+AQHI12+AQHI13+AQHI14+AQHI15+AQHI16+AQHI17+AQHI18+AQHI19+AQHI20+AQHI21+AQHI22+AQHI23+AQHI24)/24;%����ʱ����ƽ����
AQ3(:,:,1,1)=AR17+AR18+AR19+AR20+AR21+AR22+AR23+AR24;%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��
AQ(:,:,1,1)=(AQ2(:,:,1,1)+AQ3(:,:,1,1))/24;  %%%AQӢ����㱱��ʱ����ƽ����

AR=AQ(:,:,1,1)
AQA=AR;
AR(find(AR<=0)) = 0;
AR(find(AR>0&AR<=1.88)) = 1;%��0-1.88��Χ�ڵĵ��ֵ���¸�ֵΪ1��AR�����е�0-1.88��Χ���Ѿ����ı�Ϊ1����������ֵ���䡣
AR(find(AR>1.88&AR<=3.76)) =2; %�������Ѿ���1-1.88��Χ�ڵĵ㸳ֵΪ1�Ļ����Ͻ�1.88-3.76��Χ�ڵ����¸�ֵΪ2.
AR(find(AR>3.76&AR<=5.64)) = 3;
AR(find(AR>5.64&AR<=7.52)) = 4;
AR(find(AR>7.52&AR<=9.41)) = 5;
AR(find(AR>9.41&AR<=11.29)) = 6;
AR(find(AR>11.29&AR<=12.91)) = 7;
AR(find(AR>12.91&AR<=15.07)) = 8;
AR(find(AR>15.07&AR<=17.22)) = 9;
AR(find(AR>17.22&AR<=19.37)) = 10;
AR(find(AR>19.37)) = 11;

ARX=AR
ARX(find(ARX<=0)) = 0;
ARX(find(ARX>0&ARX<=3)) = 1;%��0-1.88��Χ�ڵĵ��ֵ���¸�ֵΪ1��AR�����е�0-1.88��Χ���Ѿ����ı�Ϊ1����������ֵ���䡣
ARX(find(ARX>3&ARX<=6)) =2; %�������Ѿ���1-1.88��Χ�ڵĵ㸳ֵΪ1�Ļ����Ͻ�1.88-3.76��Χ�ڵ����¸�ֵΪ2.
ARX(find(ARX>6&ARX<=7)) = 3;
ARX(find(ARX>7&ARX<=10)) = 4;
ARX(find(ARX>10)) = 5;

[x1,y1]=findpoint(113.235,23.1422,lonmodel,latmodel); %��ȡ��Ӧ��γ�ȵĸ������
[x2,y2]=findpoint(113.261,23.105,lonmodel,latmodel);
[x3,y3]=findpoint(113.348,23.0916,lonmodel,latmodel);
[x4,y4]=findpoint(113.433,23.105,lonmodel,latmodel);
[x5,y5]=findpoint(113.352,22.9477,lonmodel,latmodel);
[x6,y6]=findpoint(113.215,23.3917,lonmodel,latmodel);
[x7,y7]=findpoint(113.26,23.1331,lonmodel,latmodel);
[x8,y8]=findpoint(113.568,23.2783,lonmodel,latmodel);
[x9,y9]=findpoint(113.281,23.1569,lonmodel,latmodel);
[x10,y10]=findpoint(113.589,23.5538,lonmodel,latmodel);


tmpmean(1)=AQA(x1,y1);  %��ȡ�ø���ֵ
tmpmean(2)=AQA(x2,y2);
tmpmean(3)=AQA(x3,y3);
tmpmean(4)=AQA(x4,y4);
tmpmean(5)=AQA(x5,y5);
tmpmean(6)=AQA(x6,y6);
tmpmean(7)=AQA(x7,y7);
tmpmean(8)=AQA(x8,y8);
tmpmean(9)=AQA(x9,y9);
tmpmean(10)=AQA(x10,y10);
A(1)=mean(tmpmean); %�����ϸ����ƽ��ֵ

[nx,ny]=size(lonmodel);%��ȡ���������е�����������Ⱦ��Ũ����������Ӧ�ľ�γ������Ӧ�ĸ��һ���ж��ٸ�������X�����ж��ٸ���㣬Y�����ж��ٸ���㡣��

load('F:\graduate\��ҵ����\����\landscan\npop.mat'); %��ȡ�ҵ�mat�ļ�

D(nx,ny)=0;%����һ��ά��Ϊ��nx��ny�������飬���������ֵ��Ϊ0��
for i=1:nx 
    for j=1:ny
        D(i,j)=npop(i,j)*AQ(i,j,1,1);
    end
    %disp(i); %��ʾ���ȣ����е��ڼ�����
end

%%%%%% A*B(A��B�������ߴ��ķ����������) A.*B(A��B�ľ������������Ӧ��ĵ���ˣ�

npop(find(npop<=0)) = 0;
npop(find(npop>0&npop<=10)) = 1;  %��0-1.88��Χ�ڵĵ��ֵ���¸�ֵΪ1��AR�����е�0-1.88��Χ���Ѿ����ı�Ϊ1����������ֵ���䡣
npop(find(npop>10&npop<=50)) =2;  %�������Ѿ���1-1.88��Χ�ڵĵ㸳ֵΪ1�Ļ����Ͻ�1.88-3.76��Χ�ڵ����¸�ֵΪ2.
npop(find(npop>50&npop<=100)) = 3;
npop(find(npop>100&npop<=200)) = 4;
npop(find(npop>200&npop<=500)) = 5;
npop(find(npop>500&npop<=1000)) = 6;
npop(find(npop>1000&npop<=1500)) = 7;
npop(find(npop>1500&npop<=2000)) = 8;
npop(find(npop>2000&npop<=5000)) = 9;
npop(find(npop>5000&npop<=10000)) = 10;
npop(find(npop>1000)) = 11;

D=sqrt(AR.*npop); %%%%B=sqrt(A)�Ծ����е�ÿ��Ԫ����ƽ����(A=B.*B)��B=sqrtm(A)�ǶԾ�����ƽ������A=B*B��


%load D:\matlab\MATLAB2014b\color13.mat
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('AQHI20180124')
%colormap(color13);
hc=colorbar
%hc=colorbar('YTickLabel',{'0','L','M','H','VH','S'}); %ɫ���ò�ͬ����������ʾɫ��
%caxis([3,5]);
%hc.Ticks = 0:5;%11���̶ȡ�
%hc.TickLabels=[0,1,2,3,4,5];% �Զ���ɫ���ֵ������ɫ����Ӧ����ʵ��ֵ����Ӧ��
%set(gca,'clim',[0 5]);  %�趨��ͼҪ�ص�ȡֵ��Χ
%set(get(hc,'ylabel'),'String','fontsize',10);  % ��ɫ��ӵ�λ


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����ͼ��
 %print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\AR2-20180101'])%%�������������ĸĸģ���������������
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
