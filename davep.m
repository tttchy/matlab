clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');
% ����ȥ����һ�����Ⱦ������
%������Ҫ�صı���
psum(102,81,1,25)=0;
vsum(102,81,1,25)=0;
rsum(102,81,1,25)=0;
for k=1:25 %���ڶ�ȡ��ͬ���ļ���
   % subplot(3,4,k-12); �ֿ�
for j=k+1 ;   %%�������������ĸĸģ���������������
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)]; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];
%%%%%%%%%%%%%%%%%%%%����ѹ��

for i=1:16;
T1=ncread(ncfile,'RN');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'RN');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j-1))/24;  %%%AQӢ����㱱��ʱ����ƽ����
%%%%%%%%%%%%%%%%%%%

load D:\matlab\MATLAB2014b\MPL_Blues.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j)*10*24,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar������� 'LevelList',[10]  'linestyle','none'
hold on;
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j)*10*24,'LevelList',[10],'color','r');   %ʹ����ɫͼ����ʽ��dispvar������� 'LevelList',[10]  'linestyle','none'
hold off;
%[c,h]=m_contour(lonmodel1,latmodel1,wind1(:,:,1,j)*10*24,'LevelList',[10]);%��ָ����ֵ��
%clabel(c,h);
%grid,xlabel('x-axis'),ylabel('y-axis')
%set(gca,'FontSize',5);%ֻ��ͬʱ�ı�x y����ʾ�������С��
%m_contour(lonmodel1,latmodel1,wind1(:,:,1,j)/100,15,'color','r');%ʹ�õ�ֵ�ߵ���ʽ��dispvar�������,10��ʾ�����ĵ�ֵ�ߵ���Ŀ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title(['RAIN-201801',sprintf('%02d',j)]);  %��ͼ�ϵı���
colormap(MPL_Blues);
hc=colorbar; %ɫ��
caxis([0 12]);%�趨ɫ�����ɫ��Ӧֵ�÷�ΧΪ0-11֮�䡣����11�Ľ��䵽11�ϣ���ʵ��ֵ��Ӧ��
%set(gca,'clim',[980 1025]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','MM','fontsize',10);  % ��ɫ��ӵ�λ
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\RAIN-201801',sprintf('%02d',j)]);%������ļ����¡�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
end
%hc=colorbar('position',[0.909 0.2 0.02 0.6]) 
%set(get(hc,'ylabel'),'String','hPa','fontsize',10);  % ��ɫ��ӵ�λ
%print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\DAVEPRSFC-201801-2']);%������ļ����¡�
