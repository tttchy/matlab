
clear all;

ncfilelocat='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
lonmodel=ncread(ncfilelocat,'LON');
latmodel=ncread(ncfilelocat,'LAT');
% ����ȥ����һ�����Ⱦ�����ݣ���������Ⱦ�ﻭ��ͬһ��ͼ�ϣ�һ���µġ�
for k=01:25  %���ڶ�ȡ��ͬ���ļ���
for j=k+1:k+3     %%�������������ĸĸģ���������������
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)] %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
for i=1:24 % ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��

subplot(2,2,1);%��ͼ�δ��ڷָ�� m��n��,������p��ָ�����Ӵ���Ϊ��ǰ���ڡ��Ӵ��ڰ����������ң��������½��б�š���һ������M AT L A B�ĵ�ǰ�汾��Ҳ��д��s u b p l o t ( m n p )��
temp=ncread(ncfile,'PM25');
temp=squeeze(temp(:,:,1,i));
load D:\matlab\MATLAB2014b\color3.mat
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,temp,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('PM2.5');  %��ͼ�ϵı���
colormap(color3);
hc=colorbar; %ɫ��
set(gca,'clim',[0 200]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','��g m^-^3','fontsize',10);  % ��ɫ��ӵ�λ


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2);
temp=ncread(ncfile,'SO2');
temp=squeeze(temp(:,:,1,i));
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,temp,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('SO2');  %��ͼ�ϵı���
hc=colorbar; %ɫ��
%set(gca,'clim',[0 200]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','��g m^-^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3);
temp=ncread(ncfile,'O3');
temp=squeeze(temp(:,:,1,i));
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,temp,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('O3');  %��ͼ�ϵı���
hc=colorbar; %ɫ��
%set(gca,'clim',[0 100]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','��g m^-^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,2,4);
temp=ncread(ncfile,'NO2');
temp=squeeze(temp(:,:,1,i));
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,temp,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 

title('NO2')
hc=colorbar; %ɫ��
%set(gca,'clim',[0 150]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','��g m^-^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(i<17)
str=sprintf('%02d',i+8);
suptitle(['201801',sprintf('%02d',j),'/',str])  %���ֿ������ܱ���
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\201801',sprintf('%02d',k),'\201801',sprintf('%02d',j),str]); %%�������������ĸĸģ���������������
else
str=sprintf('%02d',i-16);
suptitle(['201801',sprintf('%02d',j+1),'/',str])  %���ֿ������ܱ���
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\201801',sprintf('%02d',k),'\201801',sprintf('%02d',j+1),str]);%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
end

end
end
end



