clear all;
ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');

%��1��2�ŵı�������
 j=1
 rsum(102,81,1,25)=0;
% subplot(2,2,1);%��ͼ�δ��ڷָ�� m��n��,������p��ָ�����Ӵ���Ϊ��ǰ���ڡ��Ӵ��ڰ����������ң��������½��б�š���һ������M AT L A B�ĵ�ǰ�汾��Ҳ��д��s u b p l o t ( m n p )��
 %ncfile='I:\cmaqout\tianchunyan\20180101\METCRO2D.CN09GD_20180102'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 %ncfile2='I:\cmaqout\tianchunyan\20180101\METDOT3D.CN09GD_20180102';
 ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO2D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
for i=1:16;
T1=ncread(ncfile,'RN');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

 ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\METCRO2D.CN09GD_20171231'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171230\METDOT3D.CN09GD_20171231';
 %ncfile='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METCRO2D.CN09GD_20180101'; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
 %ncfile2='F:\graduate\��ҵ����\����\othersdata\cmaq\20171231\METDOT3D.CN09GD_20180101';
rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'RN');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j))/24;  %%%AQӢ����㱱��ʱ����ƽ����%���ֳ������������⣬��Ϊj-1���Ǹ�Ϊj�ˡ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load D:\matlab\MATLAB2014b\MPL_Blues.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j)*10,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('RAIN-20180101');  %��ͼ�ϵı���
colormap(MPL_Blues);
hc=colorbar; %ɫ��
set(gca,'clim',[0 12]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','MM','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\RAIN-20180101'])%%�������������ĸĸģ���������������
