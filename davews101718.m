clear all;
ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');

% ��һ��ķ糡��ƽ��ͼ1718�ġ�
 j=1;
usum(103,82,1,25)=0;
vsum(103,82,1,25)=0;
wsum(102,81,1,25)=0;
ncfile='I:\cmaqout\tianchunyan\20180101\METCRO2D.CN09GD_20180102'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
ncfile2='I:\cmaqout\tianchunyan\20180101\METDOT3D.CN09GD_20180102';
 %ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO3D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 %ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
for i=1:16;
U1=ncread(ncfile2,'UWIND');
U1(:,:,1,i)=squeeze(U1(:,:,1,i));
usum(:,:,1,i+1)=U1(:,:,1,i)+usum(:,:,1,i);
end
uwind2(:,:,1,j)=usum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

 ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO2D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
 %ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\METCRO2D.CN09GD_20171231'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 %ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\METDOT3D.CN09GD_20171231';
 usum(:,:,1,17)=0;
for i=17:24;
U2=ncread(ncfile2,'UWIND');
U2(:,:,1,i+1)=squeeze(U2(:,:,1,i));
usum(:,:,1,i+1)=U1(:,:,1,i)+usum(:,:,1,i);
end
uwind3(:,:,1,j)=usum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

 %ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO2D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
  %ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
  ncfile='I:\cmaqout\tianchunyan\20180101\METCRO2D.CN09GD_20180102'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
  ncfile2='I:\cmaqout\tianchunyan\20180101\METDOT3D.CN09GD_20180102';
for i=1:16;
V1=ncread(ncfile2,'VWIND');
V1(:,:,1,i)=squeeze(V1(:,:,1,i));
vsum(:,:,1,i+1)=V1(:,:,1,i)+vsum(:,:,1,i);
end
vwind2(:,:,1,j)=vsum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

 ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO2D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
 %ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\METCRO2D.CN09GD_20171231'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 %ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\METDOT3D.CN09GD_20171231';
vsum(:,:,1,17)=0;
for i=17:24;
V2=ncread(ncfile2,'VWIND');
V2(:,:,1,i)=squeeze(V2(:,:,1,i));
vsum(:,:,1,i+1)=V2(:,:,1,i)+vsum(:,:,1,i);
end
vwind3(:,:,1,j)=vsum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

 %ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO2D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 %ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
ncfile='I:\cmaqout\tianchunyan\20180101\METCRO2D.CN09GD_20180102'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 ncfile2='I:\cmaqout\tianchunyan\20180101\METDOT3D.CN09GD_20180102';
for i=1:16;
WD1=ncread(ncfile,'PBL');
WD1(:,:,1,i)=squeeze(WD1(:,:,1,i));
wsum(:,:,1,i+1)=WD1(:,:,1,i)+wsum(:,:,1,i);
end
wind2(:,:,1,j)=wsum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

 ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO2D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
%ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\METCRO2D.CN09GD_20171231'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
%ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\METDOT3D.CN09GD_20171231';
wsum(:,:,1,17)=0 ;
for i=17:24;
WD2=ncread(ncfile,'PBL');
WD2(:,:,1,i)=squeeze(WD2(:,:,1,i));
wsum(:,:,1,i+1)=WD2(:,:,1,i)+wsum(:,:,1,i);
end
wind3(:,:,1,j)=wsum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j))/24;  %%%AQӢ����㱱��ʱ����ƽ����
uwind1(:,:,1,j)=(uwind2(:,:,1,j)+uwind3(:,:,1,j))/24;  %%%AQӢ����㱱��ʱ����ƽ����
vwind1(:,:,1,j)=(vwind2(:,:,1,j)+vwind3(:,:,1,j))/24;  %%%AQӢ����㱱��ʱ����ƽ����

QQ2=wind1(:,:,1,j);
[x1,y1]=findpoint(113.235,23.1422,lonmodel1,latmodel1); %��ȡ��Ӧ��γ�ȵĸ������
[x2,y2]=findpoint(113.261,23.105,lonmodel1,latmodel1);
[x3,y3]=findpoint(113.348,23.0916,lonmodel1,latmodel1);
[x4,y4]=findpoint(113.433,23.105,lonmodel1,latmodel1);
[x5,y5]=findpoint(113.352,22.9477,lonmodel1,latmodel1);
[x6,y6]=findpoint(113.215,23.3917,lonmodel1,latmodel1);
[x7,y7]=findpoint(113.26,23.1331,lonmodel1,latmodel1);
[x8,y8]=findpoint(113.568,23.2783,lonmodel1,latmodel1);
[x9,y9]=findpoint(113.281,23.1569,lonmodel1,latmodel1);
[x10,y10]=findpoint(113.589,23.5538,lonmodel1,latmodel1);

tmpmean(1)=QQ2(x1,y1);  %��ȡ�ø���ֵ
tmpmean(2)=QQ2(x2,y2);
tmpmean(3)=QQ2(x3,y3);
tmpmean(4)=QQ2(x4,y4);
tmpmean(5)=QQ2(x5,y5);
tmpmean(6)=QQ2(x6,y6);
tmpmean(7)=QQ2(x7,y7);
tmpmean(8)=QQ2(x8,y8);
tmpmean(9)=QQ2(x9,y9);
tmpmean(10)=QQ2(x10,y10);
A(1)=mean(tmpmean) %�����ϸ����ƽ��ֵ




load D:\matlab\MATLAB2014b\color11.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j),32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
hold on;
m_quiver(lonmodel2,latmodel2,uwind1(:,:,1,j),vwind1(:,:,1,j),10,'color','k');%��ʸ����ͷ�ķ�ʽ��ͼ��10�ǵ��ڼ�ͷ����.ֵԽ��ʸ����ͷԽ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('Q&W-20180102');

colormap(color11);
hc=colorbar; %ɫ��
%set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ
%set(get(hc,'ylabel'),'String','m/s','fontsize',10);  % ��ɫ��ӵ�λ
set(gca,'clim',[0.003 0.013]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','kg/kg','fontsize',10);  % ��ɫ��ӵ�λ

%suptitle('20180102')
% print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\DAVEQ&W-20180102'])%%�������������ĸĸģ���������������
