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
%  �������㷨��AQHIͼ�ĶԱ�ͼ��
for k=01 %���ڶ�ȡ��ͬ���ļ���
for j=k+1     %%�������������ĸĸģ���������������
   ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]  %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
    %ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
for i=1:24% ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��
subplot(1,2,1);
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

AQHI1=((ARNO2+ARO3+ARPM25+ARSO2)*10)/26.6304
AR=ARNO2+ARO3+ARPM25+ARSO2


load D:\matlab\MATLAB2014b\color12.mat
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AQHI1,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
set(gca,'FontSize',8);%ֻ��ͬʱ�ı�x y����ʾ�������С��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('AQHI');  %��ͼ�ϵı���
colormap(color12);
hc=colorbar; %ɫ��
caxis([0,11]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ
%set(get(hc,'ylabel'),'String','��g m^-^3','fontsize',10);  % ��ɫ��ӵ�λ

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

ARNO2=100*(exp(0.0004462559*temp3)-1);  %AR(NO2) = [exp (��(NO2) �� C(NO2)) �C 1] �� 100% 
ARO3=100*(exp(0.0005116328*temp2)-1) ;  %AR(O3) = [exp (��(O3) �� C(O3)) �C 1] �� 100% ��(O3) = 0.0005116328 
ARPM25=100*(exp(0.0002180567*temp1)-1);  %AR(PM2.5) = [exp (��(PM2.5) �� C(PM2.5)) �C 1] �� 100%��(PM2.5) = 0.0002180567
ARSO2=100*(exp(00.0001393235*(temp4/10.45))-1) ; 
%AR=ARNO2+ARO3+ARPM25
AQHI1=((ARNO2+ARO3+ARPM25)*10)/26.6304
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
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,AR,32','linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
set(gca,'FontSize',7);%ֻ��ͬʱ�ı�x y����ʾ�������С��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('%AR');  %��ͼ�ϵı���
colormap(color12);
hc=colorbar; %ɫ��
caxis([0,11])
hc.Ticks = 0:11;%11���̶ȡ�
hc.TickLabels=[0,1.88,3.76,5.64,7.52,9.41,11.29,12.91,15.07,17.22,19.37 20];% �Զ���ɫ���ֵ������ɫ����Ӧ����ʵ��ֵ����Ӧ��
%set(gca,'clim',[0 20]);  %�趨��ͼҪ�ص�ȡֵ��Χ
%set(get(hc,'ylabel'),'String','��g m^-^3','fontsize',10);  % ��ɫ��ӵ�λ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17)
    str=sprintf('%02d',i+8);
    suptitle(['201801',sprintf('%02d',j),'/',str])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\1aqhi201801',sprintf('%02d',j),str]); %%�������������ĸĸģ���������������
    else
    str=sprintf('%02d',i-16);
     suptitle(['201801',sprintf('%02d',j+1),'/',str])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\1aqhi201801',sprintf('%02d',j+1),str]);%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
    end
end
if(j==k+2)
   if(i<17)
   str=sprintf('%02d',i+8);
   suptitle(['201801',sprintf('%02d',j),'/',str])  %���ֿ������ܱ���
   print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����2��\201801',sprintf('%02d',j),str]); %%�������������ĸĸģ���������������
   else
   str=sprintf('%02d',i-16);
   suptitle(['201801',sprintf('%02d',j+1),'/',str])  %���ֿ������ܱ���
   print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����2��\201801',sprintf('%02d',j+1),str]);%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
   end
end
if(j==k+3)
   if(i<17)
   str=sprintf('%02d',i+8);
   suptitle(['201801',sprintf('%02d',j-31),'/',str])  %���ֿ������ܱ���
   print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����3��\201801',sprintf('%02d',j-31),str]); %%�������������ĸĸģ���������������
   else
   str=sprintf('%02d',i-16);
   suptitle(['201801',sprintf('%02d',j+1-31),'/',str])  %���ֿ������ܱ���
   print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����3��\201801',sprintf('%02d',j+1-31),str]);%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
   end    
end

end
end
end