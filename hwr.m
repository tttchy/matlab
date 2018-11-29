clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel=ncread(ncfilelocat1,'LAT');

A=zeros(24,1);
B=zeros(24,1);
C=zeros(24,1);
% ����ȥ����һ�����Ⱦ������,��ȡ��ʱ���������ϣ�ÿ��ҳ�滭6��ʱ�̵ġ�����ʱ�ģ�
for k=16; %���ڶ�ȡ��ͬ���ļ���
for j=k+1  ;   %%�������������ĸĸģ���������������
 ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)]; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
for i=5:6:24% ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��
subplot(2,3,1);
Q2=ncread(ncfile,'SO2');
Q2=squeeze(Q2(:,:,1,i));

load D:\matlab\MATLAB2014b\CBR_coldhot.mat
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2/10.45,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i<17);
str=sprintf('%02d',i+8);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str]);
else
str=sprintf('%02d',i-16);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str]);
end
colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 55]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,2);
Q2=ncread(ncfile,'SO2');
Q2=squeeze(Q2(:,:,1,i+1));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2/10.45,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+1<17);
str=sprintf('%02d',i+8+1);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str]);
else
str=sprintf('%02d',i-16+1);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str]);
end
colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 55]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,3);
Q2=ncread(ncfile,'SO2');
Q2=squeeze(Q2(:,:,1,i+2));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2/10.45,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+2<17);
str=sprintf('%02d',i+8+2);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str]);
else
str=sprintf('%02d',i-16+2);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str]);
end
colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 55]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,4);
Q2=ncread(ncfile,'SO2');
Q2=squeeze(Q2(:,:,1,i+3));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2/10.45,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+3<17);
str=sprintf('%02d',i+8+3);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str]);
else
str=sprintf('%02d',i-16+3);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str]);
end

colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 55]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5);
Q2=ncread(ncfile,'SO2');
Q2=squeeze(Q2(:,:,1,i+4));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2/10.45,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+4<17);
str=sprintf('%02d',i+8+4);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str]);
else
str=sprintf('%02d',i-16+4);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str]);
end
colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 55]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,6);
Q2=ncread(ncfile,'SO2');
Q2=squeeze(Q2(:,:,1,i+5));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2/10.45,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+5<17);
str=sprintf('%02d',i+8+5);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str]);
else
str=sprintf('%02d',i-16+5);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str]);
end
colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[0 55]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17);
    str=sprintf('%02d',i+8);
    suptitle(['SO2-201801',sprintf('%02d',j)])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\SO2-201801',sprintf('%02d',j),str])%%�������������ĸĸģ���������������
    else
    str=sprintf('%02d',i-16);
     suptitle(['SO2-201801',sprintf('%02d',j+1)])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\SO2-201801',sprintf('%02d',j+1),str])%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
    end
end


end
end
end