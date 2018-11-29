clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
lonmodel=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel=ncread(ncfilelocat1,'LAT');



load('F:\graduate\��ҵ����\����\npop.mat')
load('F:\graduate\��ҵ����\����\ARX.mat')
load('F:\graduate\��ҵ����\����\AR.mat')
ARX
max(max(ARX))
min(min(ARX))

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
A(1)=mean(tmpmean);%�����ϸ����ƽ��ֵ
A
%load D:\matlab\MATLAB2014b\color13.mat

m_proj('mercator','lon',[112.9,114.1],'lat',[22.37,24]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,ARX,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('AQHI20180124')
%colormap(color13);
hc=colorbar
%set(gca,'clim',[0 4])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����ͼ��
 %print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\AR2-20180124'])%%�������������ĸĸģ���������������

