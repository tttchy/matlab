clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');
% ����ȥ����һ�����Ⱦ������
%������Ҫ�صı���
psum(103,82,1,25)=0;
vsum(103,82,1,25)=0;
rsum(102,81,1,25)=0;
for k=01:25;  %���ڶ�ȡ��ͬ���ļ���
for j=k+1 ;   %%�������������ĸĸģ���������������
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)]; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];
%%%%%%%%%%%%%%%%%%%%���¶ȳ�

for i=1:16;
T1=ncread(ncfile,'TEMP2');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'TEMP2');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j-1))/24;  %%%AQӢ����㱱��ʱ����ƽ����

%load D:\matlab\MATLAB2014b\color11.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j)-273.15,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title(['T2-201801',sprintf('%02d',j)]);
%colormap(color11);
hc=colorbar; %ɫ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','K','fontsize',10);  % ��ɫ��ӵ�λ
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\DAVET2-201801',sprintf('%02d',j)]);%������ļ����¡�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%���߽��߶�
for i=1:16;
PBL1=ncread(ncfile,'PBL');
PBL1(:,:,1,i)=squeeze(PBL1(:,:,1,i));
psum(:,:,1,i+1)=PBL1(:,:,1,i)+psum(:,:,1,i);
end
pbl2(:,:,1,j)=psum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

psum(:,:,1,17)=0 ;
for i=17:24;
PBL2=ncread(ncfile,'PBL');
PBL2(:,:,1,i)=squeeze(PBL2(:,:,1,i));
psum(:,:,1,i+1)=PBL2(:,:,1,i)+psum(:,:,1,i);
end
pbl3(:,:,1,j)=psum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

pbl1(:,:,1,j)=(pbl2(:,:,1,j)+pbl3(:,:,1,j-1))/24;  %%%AQӢ����㱱��ʱ����ƽ����

%load D:\matlab\MATLAB2014b\color11.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,pbl1(:,:,1,j),32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title(['PBL-201801',sprintf('%02d',j)]);
%colormap(color11);
hc=colorbar; %ɫ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','M','fontsize',10);  % ��ɫ��ӵ�λ
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\DAVEPBL-201801',sprintf('%02d',j)]);%������ļ����¡�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%����ˮ��
for i=1:16;
rain1=ncread(ncfile,'RC');
rain1(:,:,1,i)=squeeze(rain1(:,:,1,i));
rain11=ncread(ncfile,'RN');
rain11(:,:,1,i)=squeeze(rain11(:,:,1,i));

rsum(:,:,1,i+1)=rain1(:,:,1,i)+rain11(:,:,1,i)+rsum(:,:,1,i);
end
RCN2(:,:,1,j)=rsum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

rsum(:,:,1,17)=0 ;
for i=17:24;
rain2=ncread(ncfile,'RC');
rain2(:,:,1,i)=squeeze(rain2(:,:,1,i));
rain22=ncread(ncfile,'RN');clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');
% ����ȥ����һ�����Ⱦ������
%������Ҫ�صı���
psum(103,82,1,25)=0;
vsum(103,82,1,25)=0;
rsum(102,81,1,25)=0;
for k=01:25;  %���ڶ�ȡ��ͬ���ļ���
for j=k+1 ;   %%�������������ĸĸģ���������������
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)]; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];
%%%%%%%%%%%%%%%%%%%%����ѹ��

for i=1:16;
T1=ncread(ncfile,'PRSFC');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'PRSFC');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j-1))/24;  %%%AQӢ����㱱��ʱ����ƽ����

load D:\matlab\MATLAB2014b\cmp_b2r.mat;
m_proj('mercator','lon',[111,115],'lat',[21,25]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j)/100,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
%m_contour(lonmodel1,latmodel1,wind1(:,:,1,j)/100,15);%ʹ�õ�ֵ�ߵ���ʽ��dispvar�������,10��ʾ�����ĵ�ֵ�ߵ���Ŀ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title(['PRSFC-201801',sprintf('%02d',j)]);
colormap(cmp_b2r);
hc=colorbar; %ɫ��
set(gca,'clim',[980 1025]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','hPa','fontsize',10);  % ��ɫ��ӵ�λ
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\DAVEPRSFC-201801',sprintf('%02d',j)]);%������ļ����¡�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
end
rain22(:,:,1,i)=squeeze(rain22(:,:,1,i));
rsum(:,:,1,i+1)=rain2(:,:,1,i)+rain22(:,:,1,i)+rsum(:,:,1,i);
end
RCN3(:,:,1,j)=rsum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

RCN1(:,:,1,j)=(RCN2(:,:,1,j)+RCN3(:,:,1,j-1))/24;  %%%AQӢ����㱱��ʱ����ƽ����
%load D:\matlab\MATLAB2014b\color11.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,RCN1(:,:,1,j)*10,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title(['RIAN-201801',sprintf('%02d',j)]);
%colormap(color11);
hc=colorbar; %ɫ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','mm','fontsize',10);  % ��ɫ��ӵ�λ
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\DAVErain-201801',sprintf('%02d',j)]);%������ļ����¡�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
end