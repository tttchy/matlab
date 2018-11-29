clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');

% ����ȥ����һ�����Ⱦ������
%ͨ���ı�������Ի��糡ͼ��ˮ������ͼ��
m=7;
n=19
usum(1:n,1:m,1)=0;%%sum(46:64,1,1),��������ά����sum(64,1,1).
vsum(1:n,1:m,1)=0;
wsum(1:n,1:m,1)=0;

for k=01:25;  %���ڶ�ȡ��ͬ���ļ���
for j=k+1 ;   %%�������������ĸĸģ���������������
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO3D.CN09GD_201801',sprintf('%02d',j)]; %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];

for i=1:16;
U1=ncread(ncfile2,'UWIND');
U1=squeeze(U1(46:64,44,1:m,i)); %������U1Ϊ19��10single����ά���顣
usum(1:n,1:m,i+1)=U1+usum(1:n,1:m,i);
end
uwind2(1:n,1:m,j)=usum(1:n,1:m,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ

usum(1:n,1:m,17)=0;
for i=17:24;
U2=ncread(ncfile2,'UWIND');
U2=squeeze(U2(46:64,44,1:m,i));
usum(1:n,1:m,i+1)=U1+usum(1:n,1:m,i);
end
uwind3(1:n,1:m,j)=usum(1:n,1:m,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

for i=1:16;
V1=ncread(ncfile2,'VWIND');
V1=squeeze(V1(46:64,44,1:m,i));
vsum(1:n,1:m,i+1)=V1+vsum(1:n,1:m,i);
end
vwind2(1:n,1:m,j)=vsum(1:n,1:m,17);%��j�������ʱǰ16��ʱ�̣�����ʱ��9-24ʱ
vsum(1:n,1:m,17)=0;
for i=17:24;
V2=ncread(ncfile2,'VWIND');
V2=squeeze(V2(46:64,44,1:m,i));
vsum(1:n,1:m,i+1)=V2+vsum(1:n,1:m,i);
end
vwind3(1:n,1:m,j)=vsum(1:n,1:m,25);%��j�������ʱ�ĺ�8��ʱ�̣�����ʱ�ĵ�j+1���1-8ʱ��

uwind1(1:n,1:m,j)=(uwind2(1:n,1:m,j)+uwind3(1:n,1:m,j-1));  %%%AQӢ����㱱��ʱ����ƽ����
vwind1(1:n,1:m,j)=(vwind2(1:n,1:m,j)+vwind3(1:n,1:m,j-1));  %%%AQӢ����㱱��ʱ����ƽ����
wind2(1:n,1:m,j)=uwind1(1:n,1:m,j).*uwind1(1:n,1:m,j);
wind3(1:n,1:m,j)=vwind1(1:n,1:m,j).*vwind1(1:n,1:m,j);
wind1(1:n,1:m,j)=(sqrt(wind2(1:n,1:m,j)+wind3(1:n,1:m,j)))/24;  %%%AQӢ����㱱��ʱ����ƽ����

ws=wind1(1:n,1:m,j);
uw=uwind1(1:n,1:m,j)/24;
vw=vwind1(1:n,1:m,j)/24

nlon=squeeze(lonmodel1(46:64,44)); %��ģʽ�ľ��ȶ�ȡ�����������������nlon��
nlon1=squeeze(lonmodel2(46:64,44));
nz=1:m;
[xx,zz]=meshgrid(nlon,nz); %�����Ⱥʹ�ֱ����������Ը�����ʽ��ֵ��[xx,zz].
[xx1,zz1]=meshgrid(nlon1,nz);
xx=xx';  %xx'���õ�xx������ת��
xx1=xx1';
zz1=zz1';
zz=zz';



load D:\matlab\MATLAB2014b\color11.mat;

%m_proj('mercator','lon',[112.85,114.2],'lat','23');  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
contourf(xx,zz,ws,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������,32��ʾ���ĵ�ֵ�ߵ���Ŀ��
hold on;
plot([113.3 113.3],[0 7],'r'); %��һ����ֱ��x���ֱ�ߡ�
%hold off;
quiver(xx1,zz1,uw,vw,0.25,'color','k');%��ʸ����ͷ�ķ�ʽ��ͼ��10�ǵ��ڼ�ͷ����.
hold off;
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title(['W-lon201801',sprintf('%02d',j)]);
colormap(color11);
hc=colorbar; %ɫ��
set(gca,'clim',[0 10]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','m/s','fontsize',10);  % ��ɫ��ӵ�λ
%set(get(hc,'xtick'),'String','γ��','fontsize',10);  % ��ɫ��ӵ�λ
xlabel('Lon(��)');%��x����ӱ��⡣

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\DAVEuvlon-201801',sprintf('%02d',j)]);%������ļ����¡�

end
end