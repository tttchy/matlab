clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel=ncread(ncfilelocat1,'LAT');

A=zeros(24,1);
B=zeros(24,1);
C=zeros(24,1);
% ����ȥ����һ�����Ⱦ������,��ȡ��ʱ���������ϣ�ÿ��ҳ�滭6��ʱ�̵ġ�������ͬ�ļ����µ�ƴ�ӡ�

for k=15; %���ڶ�ȡ��ͬ���ļ���
for j=k+1 ;    %%�������������ĸĸģ���������������
 ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)] ;%;����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
i=23;
subplot(2,3,1);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i));

load D:\matlab\MATLAB2014b\CBR_coldhot.mat;
m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
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
colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,2);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i+1));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
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
colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

end
end

for k=16; %���ڶ�ȡ��ͬ���ļ���
for j=k+1 ;    %%�������������ĸĸģ���������������
 ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)] ;%����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
i=1;
subplot(2,3,3);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+2<17)
str=sprintf('%02d',i+8);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str]);
else
str=sprintf('%02d',i-16);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str]);
end
colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,4);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i+1));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
if(i+1<17)
str=sprintf('%02d',i+8+1);%ʱ��ʱΪi������ʱΪi+8��
title(['t=',str]);
else
str=sprintf('%02d',i-16+1);%�ڶ����ˣ� i=24ʱ��Ϊ����ʱ8ʱ�� 
title(['t=',str]);
end

colormap(CBR_coldhot);
%hc=colorbar; %ɫ��
hc=colorbar('position',[0.909 0.2 0.02 0.6]) ;
set(gca,'clim',[10 120]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,5);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i+2));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
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
set(gca,'clim',[10 120]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,3,6);
Q2=ncread(ncfile,'PM25');
Q2=squeeze(Q2(:,:,1,i+3));

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,Q2,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
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
hc=colorbar('position',[0.909 0.2 0.02 0.6]);
set(gca,'clim',[10 120]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%annotation('arrow',[0.9 0.95],[0.1 0.1
%quiver(0.9,0.1,0.1,0.1) %��һ��ʸ����ͷ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1);
    if(i<17);
    str=sprintf('%02d',i+8);
    suptitle(['PM2.5-201801',sprintf('%02d',j)])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\PM25-201801',sprintf('%02d',j),str])%%�������������ĸĸģ���������������
    else
    str=sprintf('%02d',i-16);
     suptitle(['PM2.5-201801',sprintf('%02d',j+1)])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\PM25-201801',sprintf('%02d',j+1),str])%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
    end
end



end
end