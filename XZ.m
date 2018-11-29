clear all;
ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');

% ��һ��ķ糡��ƽ��ͼ1718�ġ�
 j=1
%ncfile='I:\cmaqout\tianchunyan\20180101\METCRO2D.CN09GD_20180102'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
%ncfile2='I:\cmaqout\tianchunyan\20180101\METDOT3D.CN09GD_20180102'
 ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO3D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
U1=ncread(ncfile2,'UWIND');
U1=squeeze(U1(:,23,1:10,2));
V1=ncread(ncfile2,'VWIND');
V1=squeeze(V1(:,23,1:10,2));
WD1=ncread(ncfile,'QV');
WD1=squeeze(WD1(:,23,1:10,2));

nlon=squeeze(lonmodel1(:,23)); %��ģʽ�ľ��ȶ�ȡ�����������������nlon��
nlon1=squeeze(lonmodel2(:,23));
nz=1:10;
[xx,zz]=meshgrid(nlon,nz); %�����Ⱥʹ�ֱ��������ݸ�ֵ��[xx,zz].
[xx1,zz1]=meshgrid(nlon1,nz);
xx=xx';  %xx'���õ�xx������ת��
xx1=xx1'
zz1=zz1';
zz=zz';
load D:\matlab\MATLAB2014b\color11.mat;
%m_proj('mercator','lon',[112.85,114.2],'lat','23');  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
contourf(xx,zz,WD1,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������,32��ʾ���ĵ�ֵ�ߵ���Ŀ��
hold on;
quiver(xx1,zz1,U1,V1,0.5,'color','k');%��ʸ����ͷ�ķ�ʽ��ͼ��10�ǵ��ڼ�ͷ����.
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('20180101');

colormap(color11);
hc=colorbar; %ɫ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ
%set(get(hc,'ylabel'),'String','m/s','fontsize',10);  % ��ɫ��ӵ�λ
set(gca,'clim',[0.002 0.012]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','kg/kg','fontsize',10);  % ��ɫ��ӵ�λ






%suptitle('20180102')
 print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\20180101'])%%�������������ĸĸģ���������������
