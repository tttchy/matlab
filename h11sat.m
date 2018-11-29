clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');
A=zeros(24,1);
B=zeros(24,1);
C=zeros(24,1);
% ����ȥ����һ�����Ⱦ������,��ȡ��ʱ���������ϣ�ÿ��ҳ�滭6��ʱ�̵ġ�����ʱ�ģ�
for k=16; %���ڶ�ȡ��ͬ���ļ���
for j=k+1  ;   %%�������������ĸĸģ���������������
 ncfile1=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)];  %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������

 ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)]; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];
for i=1:24% ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��
TEMP=ncread(ncfile,'WSPD10');
TEMP=squeeze(TEMP(:,:,1,i));



temp1=ncread(ncfile1,'PM25');
temp1=squeeze(temp1(:,:,1,i));
temp2=ncread(ncfile1,'O3');
temp2=squeeze(temp2(:,:,1,i));
temp3=ncread(ncfile1,'NO2');
temp3=squeeze(temp3(:,:,1,i));
temp4=ncread(ncfile1,'SO2');
temp4=squeeze(temp4(:,:,1,i));
ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI22=((ARNO2+ARO3+ARPM25+ARSO2)*10)/18.6367;
ARX=ARNO2+ARO3+ARPM25+ARSO2;





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

tmpmean(1)=ARX(x1,y1);  %��ȡ�ø���ֵ
tmpmean(2)=ARX(x2,y2);
tmpmean(3)=ARX(x3,y3);
tmpmean(4)=ARX(x4,y4);
tmpmean(5)=ARX(x5,y5);
tmpmean(6)=ARX(x6,y6);
tmpmean(7)=ARX(x7,y7);
tmpmean(8)=ARX(x8,y8);
tmpmean(9)=ARX(x9,y9);
tmpmean(10)=ARX(x10,y10);
A(i,1)=mean(tmpmean); %�����ϸ����ƽ��ֵ



end
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
% xlswrite('F:\graduate\��ҵ����\����\picture\avetime.xlsx',A)
%filename=['F:\graduate\��ҵ����\����\11sat.xlsx']
%xlswrite(filename,A,'sheet1','A:Z')%���浽exce�ļ���ȥ