clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');

for k=01:25;  %���ڶ�ȡ��ͬ���ļ���
    subplot(4,6,k);
for j=k+1 ;    %%�������������ĸĸģ���������������
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)];  %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
    %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
% ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��
%AQ3(:,:,1,1)=0
temp1=ncread(ncfile,'PM25');
temp1=squeeze(temp1(:,:,1,1));
temp2=ncread(ncfile,'O3');
temp2=squeeze(temp2(:,:,1,1));
temp3=ncread(ncfile,'NO2');
temp3=squeeze(temp3(:,:,1,1));
temp4=ncread(ncfile,'SO2');
temp4=squeeze(temp4(:,:,1,1));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
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
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI24=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
AR24=ARNO2+ARO3+ARPM25+ARSO2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AQ1=(AR1+AR2+AR3+AR4+AR5+AR6+AR7+AR8+AR9+AR10+AR11+AR12+AR13+AR14+AR15+AR16+AR17+AR18+AR19+AR20+AR21+AR22+AR23+AR24)/24%����ʱ����ƽ����
AQ2(:,:,1,j)=AR1+AR2+AR3+AR4+AR5+AR6+AR7+AR8+AR9+AR10+AR11+AR12+AR13+AR14+AR15+AR16;%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ
AQ3(:,:,1,j)=AR17+AR18+AR19+AR20+AR21+AR22+AR23+AR24;%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��
AQ(:,:,1,j)=(AQ2(:,:,1,j)+AQ3(:,:,1,j-1))/24  %%%AQӢ����㱱��ʱ����ƽ����
AR=AQ(:,:,1,j);
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

[nx,ny]=size(lonmodel);%��ȡ���������е�����������Ⱦ��Ũ����������Ӧ�ľ�γ������Ӧ�ĸ��һ���ж��ٸ�������X�����ж��ٸ���㣬Y�����ж��ٸ���㡣��

load('F:\graduate\��ҵ����\����\landscan\npop.mat'); %��ȡ�ҵ�mat�ļ�

%%%%%% A*B(A��B�������ߴ��ķ����������) A.*B(A��B�ľ������������Ӧ��ĵ���ˣ�

npop(find(npop<0)) = 0;
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

load D:\matlab\MATLAB2014b\color2.mat
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,D,10,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
%title(['01',sprintf('%02d',j)])
colormap(color2);
end  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����ͼ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
caxis([0,11]);
set(gca,'TickLable',FontSize',1);

%set(gca,'FontSize',20);  %ֻ��ͬʱ�ı�x y����ʾ�������С��
%set(get(gca,'YLabel'),'Fontsize',20) %����Ա�ע�Ķ���������̶�
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\AR&POP1-201801']);%%�������������ĸĸģ���������������

end
suptitle('���ն�');
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\AR&POP1-201801']);%%�������������ĸĸģ���������������
