clear all;
ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');

%��1��2�ŵı�������
 j=1;
 rsum(102,81,1,25)=0;
% subplot(2,2,1);%��ͼ�δ��ڷָ�� m��n��,������p��ָ�����Ӵ���Ϊ��ǰ���ڡ��Ӵ��ڰ����������ң��������½��б�š���һ������M AT L A B�ĵ�ǰ�汾��Ҳ��д��s u b p l o t ( m n p )��
 ncfile='I:\cmaqout\tianchunyan\20180101\CONC.CN09GD_20180102'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 %ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\CONC.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
for i=1:16;
T1=ncread(ncfile,'NO2');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

   %ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\CONC.CN09GD_20171231'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
   ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\CONC.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'NO2');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j))/24;  %%%AQӢ����㱱��ʱ����ƽ����%���ֳ������������⣬��Ϊj-1���Ǹ�Ϊj�ˡ�

AR=wind1(:,:,1,j);
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

tmpmean(1)=AR(x1,y1);  %��ȡ�ø���ֵ
tmpmean(2)=AR(x2,y2);
tmpmean(3)=AR(x3,y3);
tmpmean(4)=AR(x4,y4);
tmpmean(5)=AR(x5,y5);
tmpmean(6)=AR(x6,y6);
tmpmean(7)=AR(x7,y7);
tmpmean(8)=AR(x8,y8);
tmpmean(9)=AR(x9,y9);
tmpmean(10)=AR(x10,y10);
A(1)=mean(tmpmean)  %�����ϸ����ƽ��ֵ




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load D:\matlab\MATLAB2014b\CBR_coldhot.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j),32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('NO2-20180102');  %��ͼ�ϵı���
colormap(CBR_coldhot);
hc=colorbar; %ɫ��
set(gca,'clim',[10 120]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','ug/m^3','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
%print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\DAVENO2-20180102'])%%�������������ĸĸģ���������������
