clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');
% 读进去其中一天的污染物数据
%画气象要素的标量
psum(103,82,1,25)=0;
vsum(103,82,1,25)=0;
rsum(102,81,1,25)=0;
for k=01:25;  %用于读取不同的文件夹
for j=k+1 ;   %%！！！！！！改改改！！！！！！！！
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)]; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];
%%%%%%%%%%%%%%%%%%%%画温度场

for i=1:16;
T1=ncread(ncfile,'TEMP2');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%第j天的世界时前16个时刻，北京时的9-24时

rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'TEMP2');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均。

%load D:\matlab\MATLAB2014b\color11.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j)-273.15,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title(['T2-201801',sprintf('%02d',j)]);
%colormap(color11);
hc=colorbar; %色标
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','K','fontsize',10);  % 对色标加单位
print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAVET2-201801',sprintf('%02d',j)]);%输出到文件夹下。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%画边界层高度
for i=1:16;
PBL1=ncread(ncfile,'PBL');
PBL1(:,:,1,i)=squeeze(PBL1(:,:,1,i));
psum(:,:,1,i+1)=PBL1(:,:,1,i)+psum(:,:,1,i);
end
pbl2(:,:,1,j)=psum(:,:,1,17);%第j天的世界时前16个时刻，北京时的9-24时

psum(:,:,1,17)=0 ;
for i=17:24;
PBL2=ncread(ncfile,'PBL');
PBL2(:,:,1,i)=squeeze(PBL2(:,:,1,i));
psum(:,:,1,i+1)=PBL2(:,:,1,i)+psum(:,:,1,i);
end
pbl3(:,:,1,j)=psum(:,:,1,25);%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。

pbl1(:,:,1,j)=(pbl2(:,:,1,j)+pbl3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，

%load D:\matlab\MATLAB2014b\color11.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,pbl1(:,:,1,j),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title(['PBL-201801',sprintf('%02d',j)]);
%colormap(color11);
hc=colorbar; %色标
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','M','fontsize',10);  % 对色标加单位
print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAVEPBL-201801',sprintf('%02d',j)]);%输出到文件夹下。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%画降水场
for i=1:16;
rain1=ncread(ncfile,'RC');
rain1(:,:,1,i)=squeeze(rain1(:,:,1,i));
rain11=ncread(ncfile,'RN');
rain11(:,:,1,i)=squeeze(rain11(:,:,1,i));

rsum(:,:,1,i+1)=rain1(:,:,1,i)+rain11(:,:,1,i)+rsum(:,:,1,i);
end
RCN2(:,:,1,j)=rsum(:,:,1,17);%第j天的世界时前16个时刻，北京时的9-24时

rsum(:,:,1,17)=0 ;
for i=17:24;
rain2=ncread(ncfile,'RC');
rain2(:,:,1,i)=squeeze(rain2(:,:,1,i));
rain22=ncread(ncfile,'RN');clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');
% 读进去其中一天的污染物数据
%画气象要素的标量
psum(103,82,1,25)=0;
vsum(103,82,1,25)=0;
rsum(102,81,1,25)=0;
for k=01:25;  %用于读取不同的文件夹
for j=k+1 ;   %%！！！！！！改改改！！！！！！！！
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)]; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];
%%%%%%%%%%%%%%%%%%%%画气压场

for i=1:16;
T1=ncread(ncfile,'PRSFC');
T1(:,:,1,i)=squeeze(T1(:,:,1,i));
rsum(:,:,1,i+1)=T1(:,:,1,i)+rsum(:,:,1,i);
end
wind2(:,:,1,j)=rsum(:,:,1,17);%第j天的世界时前16个时刻，北京时的9-24时

rsum(:,:,1,17)=0 ;
for i=17:24;
T2=ncread(ncfile,'PRSFC');
T2(:,:,1,i)=squeeze(T2(:,:,1,i));
rsum(:,:,1,i+1)=T2(:,:,1,i)+rsum(:,:,1,i);
end
wind3(:,:,1,j)=rsum(:,:,1,25);%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。

wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均。

load D:\matlab\MATLAB2014b\cmp_b2r.mat;
m_proj('mercator','lon',[111,115],'lat',[21,25]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j)/100,'linestyle','none');   %使用填色图的形式画dispvar这个变量
%m_contour(lonmodel1,latmodel1,wind1(:,:,1,j)/100,15);%使用等值线的形式画dispvar这个变量,10表示所画的等值线的数目。
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title(['PRSFC-201801',sprintf('%02d',j)]);
colormap(cmp_b2r);
hc=colorbar; %色标
set(gca,'clim',[980 1025]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','hPa','fontsize',10);  % 对色标加单位
print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAVEPRSFC-201801',sprintf('%02d',j)]);%输出到文件夹下。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
end
rain22(:,:,1,i)=squeeze(rain22(:,:,1,i));
rsum(:,:,1,i+1)=rain2(:,:,1,i)+rain22(:,:,1,i)+rsum(:,:,1,i);
end
RCN3(:,:,1,j)=rsum(:,:,1,25);%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。

RCN1(:,:,1,j)=(RCN2(:,:,1,j)+RCN3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，
%load D:\matlab\MATLAB2014b\color11.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,RCN1(:,:,1,j)*10,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title(['RIAN-201801',sprintf('%02d',j)]);
%colormap(color11);
hc=colorbar; %色标
%set(gca,'clim',[0 10]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','mm','fontsize',10);  % 对色标加单位
print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAVErain-201801',sprintf('%02d',j)]);%输出到文件夹下。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
end