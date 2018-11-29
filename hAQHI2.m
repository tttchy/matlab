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
%�������㷨��AQHI����ʱͼ��ÿ6��Сʱ����һ��ͼ�ϣ���aqhi66�Ĳ������������ı��ˣ�����Ч����һ���ġ�
for k=15  %���ڶ�ȡ��ͬ���ļ���
for j=k+1     %%�������������ĸĸģ���������������
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]  %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
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

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%��AR���и��ƣ��Խ��л�ͼ��ʱ���ɫ���Ƕ�Ӧ�ġ�
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
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i<17)
str=sprintf('%02d',i+8);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str])
else
str=sprintf('%02d',i-16);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str])
end
colormap(color12);
%hc=colorbar; %ɫ��
caxis([0,11])
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

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

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%��AR���и��ƣ��Խ��л�ͼ��ʱ���ɫ���Ƕ�Ӧ�ġ�
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
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+1<17)
str=sprintf('%02d',i+8+1);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str])
else
str=sprintf('%02d',i-16+1);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str])
end
colormap(color12);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
for k=16 %���ڶ�ȡ��ͬ���ļ���
for j=k+1     %%�������������ĸĸģ���������������
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]  %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
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

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%��AR���и��ƣ��Խ��л�ͼ��ʱ���ɫ���Ƕ�Ӧ�ġ�
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
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i<17)
str=sprintf('%02d',i+8);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str])
else
str=sprintf('%02d',i-16);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str])
end
colormap(color12);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

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

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%��AR���и��ƣ��Խ��л�ͼ��ʱ���ɫ���Ƕ�Ӧ�ġ�
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
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+1<17)
str=sprintf('%02d',i+8+1);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str])
else
str=sprintf('%02d',i-16+1);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str])
end
colormap(color12);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

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

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%��AR���и��ƣ��Խ��л�ͼ��ʱ���ɫ���Ƕ�Ӧ�ġ�
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
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+2<17)
str=sprintf('%02d',i+8+2);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str])
else
str=sprintf('%02d',i-16+2);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str])
end
colormap(color12);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

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

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
%AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304;
AR=ARNO2+ARO3+ARPM25+ARSO2
%%%%��AR���и��ƣ��Խ��л�ͼ��ʱ���ɫ���Ƕ�Ӧ�ġ�
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
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AR,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+3<17)
str=sprintf('%02d',i+8+3);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str])
else
str=sprintf('%02d',i-16+3);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str])
end
colormap(color12);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) 
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17)
    str=sprintf('%02d',i+8);
    suptitle(['AQHI201801',sprintf('%02d',j)])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\AQHI201801',sprintf('%02d',j),str])%%�������������ĸĸģ���������������
    else
    str=sprintf('%02d',i-16);
     suptitle(['AQHI201801',sprintf('%02d',j+1)])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\AQHI201801',sprintf('%02d',j+1),str])%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
    end
end


end
end
