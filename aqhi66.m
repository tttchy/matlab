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
% �������㷨��AQHI����ʱͼ��ÿ6��Сʱ����һ��ͼ��
for k=01:25  %���ڶ�ȡ��ͬ���ļ���
for j=k+1     %%�������������ĸĸģ���������������
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]  %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
    %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
for i=1:6:24% ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��
subplot(2,3,1);
pm1=ncread(ncfile,'PM25');
pm1=squeeze(pm1(:,:,1,i));
ooo1=ncread(ncfile,'O3');
ooo1=squeeze(ooo1(:,:,1,i));
no1=ncread(ncfile,'NO2');
no1=squeeze(no1(:,:,1,i));
so1=ncread(ncfile,'SO2');
so1=squeeze(so1(:,:,1,i));

ARNO21=100*(exp(0.0004462559*no1)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO31=100*(exp(0.0005116328*ooo1)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM251=100*(exp(0.0002180567*pm1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO21=100*(exp(00.0001393235*(so1/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
AQHI11=((ARNO21+ARO31+ARPM251+ARSO21)*10)/25.0538;

load D:\matlab\MATLAB2014b\color2.mat
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AQHI11,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
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
colormap(color2);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,2);
pm2=ncread(ncfile,'PM25');
pm2=squeeze(pm2(:,:,1,i+1));
ooo2=ncread(ncfile,'O3');
ooo2=squeeze(ooo2(:,:,1,i+1));
no2=ncread(ncfile,'NO2');
no2=squeeze(no2(:,:,1,i+1));
so2=ncread(ncfile,'SO2');
so2=squeeze(so2(:,:,1,i+1));

ARNO22=100*(exp(0.0004462559*no2)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO32=100*(exp(0.0005116328*ooo2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM252=100*(exp(0.0002180567*pm2)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO22=100*(exp(00.0001393235*(so2/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
AQHI12=((ARNO22+ARO32+ARPM252+ARSO22)*10)/18.6367;

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AQHI12,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
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
colormap(color2);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,3);
pm3=ncread(ncfile,'PM25');
pm3=squeeze(pm3(:,:,1,i+2));
ooo3=ncread(ncfile,'O3');
ooo3=squeeze(ooo3(:,:,1,i+2));
no3=ncread(ncfile,'NO2');
no3=squeeze(no3(:,:,1,i+2));
so3=ncread(ncfile,'SO2');
so3=squeeze(so3(:,:,1,i+2));

ARNO23=100*(exp(0.0004462559*no3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO33=100*(exp(0.0005116328*ooo3)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM253=100*(exp(0.0002180567*pm3)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO23=100*(exp(00.0001393235*(so3/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
AQHI13=((ARNO23+ARO33+ARPM253+ARSO23)*10)/18.6367;

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AQHI13,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
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
colormap(color2);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,4);
pm14=ncread(ncfile,'PM25');
pm14=squeeze(pm14(:,:,1,i+3));
ooo14=ncread(ncfile,'O3');
ooo14=squeeze(ooo14(:,:,1,i+3));
no14=ncread(ncfile,'NO2');
no14=squeeze(no14(:,:,1,i+3));
so14=ncread(ncfile,'SO2');
so14=squeeze(so14(:,:,1,i+3));

ARNO24=100*(exp(0.0004462559*no14)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO34=100*(exp(0.0005116328*ooo14)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM254=100*(exp(0.0002180567*pm14)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO24=100*(exp(00.0001393235*(so14/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
AQHI14=((ARNO24+ARO34+ARPM254+ARSO24)*10)/18.6367;

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AQHI14,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
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
colormap(color2);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5);
pm15=ncread(ncfile,'PM25');
pm15=squeeze(pm15(:,:,1,i+4));
ooo15=ncread(ncfile,'O3');
ooo15=squeeze(ooo15(:,:,1,i+4));
no15=ncread(ncfile,'NO2');
no15=squeeze(no15(:,:,1,i+4));
so15=ncread(ncfile,'SO2');
so15=squeeze(so15(:,:,1,i+4));

ARNO25=100*(exp(0.0004462559*no15)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO35=100*(exp(0.0005116328*ooo15)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM255=100*(exp(0.0002180567*pm15)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO25=100*(exp(00.0001393235*(so15/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
AQHI15=((ARNO25+ARO35+ARPM255+ARSO25)*10)/18.6367;

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AQHI15,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+4<17)
str=sprintf('%02d',i+8+4);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str])
else
str=sprintf('%02d',i-16+4);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str])
end
colormap(color2);
%hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,6);


pm16=ncread(ncfile,'PM25');
pm16=squeeze(pm16(:,:,1,i+5));
ooo16=ncread(ncfile,'O3');
ooo16=squeeze(ooo16(:,:,1,i+5));
no16=ncread(ncfile,'NO2');
no16=squeeze(no16(:,:,1,i+5));
so16=ncread(ncfile,'SO2');
so16=squeeze(so16(:,:,1,i+5));

ARNO26=100*(exp(0.0004462559*no16)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO36=100*(exp(0.0005116328*ooo16)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM256=100*(exp(0.0002180567*pm16)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO26=100*(exp(00.0001393235*(so16/10.45))-1) ;  %AR(SO2) = [exp (��(SO2) �� C(SO2)) �C 1] �� 100% ��(SO2) = 0.0001393235 
AQHI16=((ARNO26+ARO36+ARPM256+ARSO26)*10)/18.6367;

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AQHI16,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+5<17)
str=sprintf('%02d',i+8+5);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str])
else
str=sprintf('%02d',i-16+5);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str])
end
colormap(color2);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) 
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17)
    str=sprintf('%02d',i+8);
    suptitle(['201801',sprintf('%02d',j)])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\6AQHI201801',sprintf('%02d',j),str])%%�������������ĸĸģ���������������
    else
    str=sprintf('%02d',i-16);
     suptitle(['201801',sprintf('%02d',j+1)])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\6AQHI201801',sprintf('%02d',j+1),str])%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
    end
end


end
end
end