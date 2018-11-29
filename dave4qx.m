  clear all;

ncfilelocat1='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\毕业论文\数据\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%读取二维气象要素的经度数据。
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%读取三维风场的经度数据
latmodel2=ncread(ncfilelocat2,'LATD');
% 读进去其中一天的污染物数据 将四种气象资料的日平均画在同一张图上


for k=01:25;  %用于读取不同的文件夹
for j=k+1 ;   %%！！！！！！改改改！！！！！！！！
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)]; %读不同文件下的不同文件%！！！！改改改！！！！！！！！
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)];


subplot(2,2,1);%将图形窗口分割成 m行n列,并设置p所指定的子窗口为当前窗口。子窗口按行由左至右，由上至下进行编号。这一命令在M AT L A B的当前版本中也被写作s u b p l o t ( m n p )。

QW1=ncread(ncfile,'Q2');
QW1=squeeze(QW1(:,:,1,1));
QW2=ncread(ncfile,'Q2');
QW2=squeeze(QW2(:,:,1,2));
QW3=ncread(ncfile,'Q2');
QW3=squeeze(QW3(:,:,1,3));
QW4=ncread(ncfile,'Q2');
QW4=squeeze(QW4(:,:,1,4));
QW5=ncread(ncfile,'Q2');
QW5=squeeze(QW5(:,:,1,5));
QW6=ncread(ncfile,'Q2');
QW6=squeeze(QW6(:,:,1,6));
QW7=ncread(ncfile,'Q2');
QW7=squeeze(QW7(:,:,1,7));
QW8=ncread(ncfile,'Q2');
QW8=squeeze(QW8(:,:,1,8));
QW9=ncread(ncfile,'Q2');
QW9=squeeze(QW9(:,:,1,9));
QW10=ncread(ncfile,'Q2');
QW10=squeeze(QW10(:,:,1,10));
QW11=ncread(ncfile,'Q2');
QW11=squeeze(QW11(:,:,1,11));
QW12=ncread(ncfile,'Q2');
QW12=squeeze(QW12(:,:,1,12));
QW13=ncread(ncfile,'Q2');
QW13=squeeze(QW13(:,:,1,13));
QW14=ncread(ncfile,'Q2');
QW14=squeeze(QW14(:,:,1,14));
QW15=ncread(ncfile,'Q2');
QW15=squeeze(QW15(:,:,1,15));
QW16=ncread(ncfile,'Q2');
QW16=squeeze(QW16(:,:,1,16));
QW17=ncread(ncfile,'Q2');
QW17=squeeze(QW17(:,:,1,17));
QW18=ncread(ncfile,'Q2');
QW18=squeeze(QW18(:,:,1,18));
QW19=ncread(ncfile,'Q2');
QW19=squeeze(QW19(:,:,1,19));
QW20=ncread(ncfile,'Q2');
QW20=squeeze(QW20(:,:,1,20));
QW21=ncread(ncfile,'Q2');
QW21=squeeze(QW21(:,:,1,21));
QW22=ncread(ncfile,'Q2');
QW22=squeeze(QW22(:,:,1,22));
QW23=ncread(ncfile,'Q2');
QW23=squeeze(QW23(:,:,1,23));
QW24=ncread(ncfile,'Q2');
QW24=squeeze(QW24(:,:,1,24));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
metQWc(:,:,1,j)=(QW1+QW2+QW3+QW4+QW5+QW6+QW7+QW8+QW9+QW10+QW11+QW12+QW13+QW14+QW15+QW16+QW17+QW18+QW19+QW20+QW21+QW22+QW23+QW24)/24;%世界时的日平均。
metcQW2(:,:,1,j)=QW1+QW2+QW3+QW4+QW5+QW6+QW7+QW8+QW9+QW10+QW11+QW12+QW13+QW14+QW15+QW16;%第j天的世界时前16个时刻，北京时的9-24时
metcQW3(:,:,1,j)=QW17+QW18+QW19+QW20+QW21+QW22+QW23+QW24;%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。
metcQW1(:,:,1,j)=(metcQW2(:,:,1,j)+metcQW3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，

m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,metcQW1(:,:,1,j),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('Q2');  %绘图上的标题
hc=colorbar; %色标
set(gca,'clim',[0.003 0.012]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','kg/kg','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
subplot(2,2,2);
pbl1=ncread(ncfile,'PBL');
pbl1=squeeze(pbl1(:,:,1,1));
pbl2=ncread(ncfile,'PBL');
pbl2=squeeze(pbl2(:,:,1,2));
pbl3=ncread(ncfile,'PBL');
pbl3=squeeze(pbl3(:,:,1,3));
pbl4=ncread(ncfile,'PBL');
pbl4=squeeze(pbl4(:,:,1,4));
pbl5=ncread(ncfile,'PBL');
pbl5=squeeze(pbl5(:,:,1,5));
pbl6=ncread(ncfile,'PBL');
pbl6=squeeze(pbl6(:,:,1,6));
pbl7=ncread(ncfile,'PBL');
pbl7=squeeze(pbl7(:,:,1,7));
pbl8=ncread(ncfile,'PBL');
pbl8=squeeze(pbl8(:,:,1,8));
pbl9=ncread(ncfile,'PBL');
pbl9=squeeze(pbl9(:,:,1,9));
pbl10=ncread(ncfile,'PBL');
pbl10=squeeze(pbl10(:,:,1,10));
pbl11=ncread(ncfile,'PBL');
pbl11=squeeze(pbl11(:,:,1,11));
pbl12=ncread(ncfile,'PBL');
pbl12=squeeze(pbl12(:,:,1,12));
pbl13=ncread(ncfile,'PBL');
pbl13=squeeze(pbl13(:,:,1,13));
pbl14=ncread(ncfile,'PBL');
pbl14=squeeze(pbl14(:,:,1,14));
pbl15=ncread(ncfile,'PBL');
pbl15=squeeze(pbl15(:,:,1,15));
pbl16=ncread(ncfile,'PBL');
pbl16=squeeze(pbl16(:,:,1,16));
pbl17=ncread(ncfile,'PBL');
pbl17=squeeze(pbl17(:,:,1,17));
pbl18=ncread(ncfile,'PBL');
pbl18=squeeze(pbl18(:,:,1,18));
pbl19=ncread(ncfile,'PBL');
pbl19=squeeze(pbl19(:,:,1,19));
pbl20=ncread(ncfile,'PBL');
pbl20=squeeze(pbl20(:,:,1,20));
pbl21=ncread(ncfile,'PBL');
pbl21=squeeze(pbl21(:,:,1,21));
pbl22=ncread(ncfile,'PBL');
pbl22=squeeze(pbl22(:,:,1,22));
pbl23=ncread(ncfile,'PBL');
pbl23=squeeze(pbl23(:,:,1,23));
pbl24=ncread(ncfile,'PBL');
pbl24=squeeze(pbl24(:,:,1,24));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
metpc(:,:,1,j)=(pbl1+pbl2+pbl3+pbl4+pbl5+pbl6+pbl7+pbl8+pbl9+pbl10+pbl11+pbl12+pbl13+pbl14+pbl15+pbl16+pbl17+pbl18+pbl19+pbl20+pbl21+pbl22+pbl23+pbl24)/24;%世界时的日平均。
metcp2(:,:,1,j)=pbl1+pbl2+pbl3+pbl4+pbl5+pbl6+pbl7+pbl8+pbl9+pbl10+pbl11+pbl12+pbl13+pbl14+pbl15+pbl16;%第j天的世界时前16个时刻，北京时的9-24时
metcp3(:,:,1,j)=pbl17+pbl18+pbl19+pbl20+pbl21+pbl22+pbl23+pbl24;%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。
metcp1(:,:,1,j)=(metcp2(:,:,1,j)+metcp3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，


m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,metcp1(:,:,1,j),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('PBL');  %绘图上的标题
hc=colorbar; %色标
set(gca,'clim',[150 700]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','m','fontsize',10);  % 对色标加单位

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3);

temp1=ncread(ncfile,'TEMP2')
temp1=squeeze(temp1(:,:,1,1));
temp2=ncread(ncfile,'TEMP2');
temp2=squeeze(temp2(:,:,1,2));
temp3=ncread(ncfile,'TEMP2');
temp3=squeeze(temp3(:,:,1,3));
temp4=ncread(ncfile,'TEMP2');
temp4=squeeze(temp4(:,:,1,4));
temp5=ncread(ncfile,'TEMP2');
temp5=squeeze(temp5(:,:,1,5));
temp6=ncread(ncfile,'TEMP2');
temp6=squeeze(temp6(:,:,1,6));
temp7=ncread(ncfile,'TEMP2');
temp7=squeeze(temp7(:,:,1,7));
temp8=ncread(ncfile,'TEMP2');
temp8=squeeze(temp8(:,:,1,8));
temp9=ncread(ncfile,'TEMP2');
temp9=squeeze(temp9(:,:,1,9));
temp10=ncread(ncfile,'TEMP2');
temp10=squeeze(temp10(:,:,1,10));
temp11=ncread(ncfile,'TEMP2');
temp11=squeeze(temp11(:,:,1,11));
temp12=ncread(ncfile,'TEMP2');
temp12=squeeze(temp12(:,:,1,12));
temp13=ncread(ncfile,'TEMP2');
temp13=squeeze(temp13(:,:,1,13));
temp14=ncread(ncfile,'TEMP2');
temp14=squeeze(temp14(:,:,1,14));
temp15=ncread(ncfile,'TEMP2');
temp15=squeeze(temp15(:,:,1,15));
temp16=ncread(ncfile,'TEMP2');
temp16=squeeze(temp16(:,:,1,16));
temp17=ncread(ncfile,'TEMP2');
temp17=squeeze(temp17(:,:,1,17));
temp18=ncread(ncfile,'TEMP2');
temp18=squeeze(temp18(:,:,1,18));
temp19=ncread(ncfile,'TEMP2');
temp19=squeeze(temp19(:,:,1,19));
temp20=ncread(ncfile,'TEMP2');
temp20=squeeze(temp20(:,:,1,20));
temp21=ncread(ncfile,'TEMP2');
temp21=squeeze(temp21(:,:,1,21));
temp22=ncread(ncfile,'TEMP2');
temp22=squeeze(temp22(:,:,1,22));
temp23=ncread(ncfile,'TEMP2');
temp23=squeeze(temp23(:,:,1,23));
temp24=ncread(ncfile,'TEMP2');
temp24=squeeze(temp24(:,:,1,24));

%metc(:,:,1,j)=(temp1+temp2+temp3+temp4+temp5+temp6+temp7+temp8+temp9+temp10+temp11+temp12+temp13+temp14+temp15+temp16+temp17+temp18+temp19+temp20+temp21+temp22+temp23+temp24)/24;%世界时的日平均。
metc2(:,:,1,j)=temp1+temp2+temp3+temp4+temp5+temp6+temp7+temp8+temp9+temp10+temp11+temp12+temp13+temp14+temp15+temp16%第j天的世界时前16个时刻，北京时的9-24时
metc3(:,:,1,j)=temp17+temp18+temp19+temp20+temp21+temp22+temp23+temp24;%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。
metc1(:,:,1,j)=(metc2(:,:,1,j)+metc3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，

m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,metc1(:,:,1,j)-273.15,32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('TEMP2');  %绘图上的标题
hc=colorbar; %色标
set(gca,'clim',[6 20]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','℃','fontsize',10);  % 对色标加单位
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,2,4);
U1=ncread(ncfile2,'UWIND');
U1=squeeze(U1(:,:,7,1));
U2=ncread(ncfile2,'UWIND');
U2=squeeze(U2(:,:,7,2));
U3=ncread(ncfile2,'UWIND');
U3=squeeze(U3(:,:,7,3));
U4=ncread(ncfile2,'UWIND');
U4=squeeze(U4(:,:,7,4));
U5=ncread(ncfile2,'UWIND');
U5=squeeze(U5(:,:,7,5));
U6=ncread(ncfile2,'UWIND');
U6=squeeze(U6(:,:,7,6));
U7=ncread(ncfile2,'UWIND');
U7=squeeze(U7(:,:,7,7));
U8=ncread(ncfile2,'UWIND');
U8=squeeze(U8(:,:,7,8));
U9=ncread(ncfile2,'UWIND');
U9=squeeze(U9(:,:,7,9));
U10=ncread(ncfile2,'UWIND');
U10=squeeze(U10(:,:,7,10));
U11=ncread(ncfile2,'UWIND');
U11=squeeze(U11(:,:,7,11));
U12=ncread(ncfile2,'UWIND');
U12=squeeze(U12(:,:,7,12));
U13=ncread(ncfile2,'UWIND');
U13=squeeze(U13(:,:,7,13));
U14=ncread(ncfile2,'UWIND');
U14=squeeze(U14(:,:,7,14));
U15=ncread(ncfile2,'UWIND');
U15=squeeze(U15(:,:,7,15));
U16=ncread(ncfile2,'UWIND');
U16=squeeze(U16(:,:,7,16));
U17=ncread(ncfile2,'UWIND');
U17=squeeze(U17(:,:,7,17));
U18=ncread(ncfile2,'UWIND');
U18=squeeze(U18(:,:,7,18));
U19=ncread(ncfile2,'UWIND');
U19=squeeze(U19(:,:,7,19));
U20=ncread(ncfile2,'UWIND');
U20=squeeze(U20(:,:,7,20));
U21=ncread(ncfile2,'UWIND');
U21=squeeze(U21(:,:,7,21));
U22=ncread(ncfile2,'UWIND');
U22=squeeze(U22(:,:,7,22));
U23=ncread(ncfile2,'UWIND');
U23=squeeze(U23(:,:,7,23));
U24=ncread(ncfile2,'UWIND');
U24=squeeze(U24(:,:,7,24));


V1=ncread(ncfile2,'VWIND');
V1=squeeze(V1(:,:,7,1));
V2=ncread(ncfile2,'VWIND');
V2=squeeze(V2(:,:,7,2));
V3=ncread(ncfile2,'VWIND');
V3=squeeze(V3(:,:,7,3));
V4=ncread(ncfile2,'VWIND');
V4=squeeze(V4(:,:,7,4));
V5=ncread(ncfile2,'VWIND');
V5=squeeze(V5(:,:,7,5));
V6=ncread(ncfile2,'VWIND');
V6=squeeze(V6(:,:,7,6));
V7=ncread(ncfile2,'VWIND');
V7=squeeze(V7(:,:,7,7));
V8=ncread(ncfile2,'VWIND');
V8=squeeze(V8(:,:,7,8));
V9=ncread(ncfile2,'VWIND');
V9=squeeze(V9(:,:,7,9));
V10=ncread(ncfile2,'VWIND');
V10=squeeze(V10(:,:,7,10));
V11=ncread(ncfile2,'VWIND');
V11=squeeze(V11(:,:,7,11));
V12=ncread(ncfile2,'VWIND');
V12=squeeze(V12(:,:,7,12));
V13=ncread(ncfile2,'VWIND');
V13=squeeze(V13(:,:,7,13));
V14=ncread(ncfile2,'VWIND');
V14=squeeze(V14(:,:,7,14));
V15=ncread(ncfile2,'VWIND');
V15=squeeze(V15(:,:,7,15));
V16=ncread(ncfile2,'VWIND');
V16=squeeze(V16(:,:,7,16));
V17=ncread(ncfile2,'VWIND');
V17=squeeze(V17(:,:,7,17));
V18=ncread(ncfile2,'VWIND');
V18=squeeze(V18(:,:,7,18));
V19=ncread(ncfile2,'VWIND');
V19=squeeze(V19(:,:,7,19));
V20=ncread(ncfile2,'VWIND');
V20=squeeze(V20(:,:,7,20));
V21=ncread(ncfile2,'VWIND');
V21=squeeze(V21(:,:,7,21));
V22=ncread(ncfile2,'VWIND');
V22=squeeze(V22(:,:,7,22));
V23=ncread(ncfile2,'VWIND');
V23=squeeze(V23(:,:,7,23));
V24=ncread(ncfile2,'VWIND');
V24=squeeze(V24(:,:,7,24));

WD1=ncread(ncfile,'WSPD10');
WD1=squeeze(WD1(:,:,1,1));
WD2=ncread(ncfile,'WSPD10');
WD2=squeeze(WD2(:,:,1,2));
WD3=ncread(ncfile,'WSPD10');
WD3=squeeze(WD3(:,:,1,3));
WD4=ncread(ncfile,'WSPD10');
WD4=squeeze(WD4(:,:,1,4));
WD5=ncread(ncfile,'WSPD10');
WD5=squeeze(WD5(:,:,1,5));
WD6=ncread(ncfile,'WSPD10');
WD6=squeeze(WD6(:,:,1,6));
WD7=ncread(ncfile,'WSPD10');
WD7=squeeze(WD7(:,:,1,7));
WD8=ncread(ncfile,'WSPD10');
WD8=squeeze(WD8(:,:,1,8));
WD9=ncread(ncfile,'WSPD10');
WD9=squeeze(WD9(:,:,1,9));
WD10=ncread(ncfile,'WSPD10');
WD10=squeeze(WD10(:,:,1,10));
WD11=ncread(ncfile,'WSPD10');
WD11=squeeze(WD11(:,:,1,11));
WD12=ncread(ncfile,'WSPD10');
WD12=squeeze(WD12(:,:,1,12));
WD13=ncread(ncfile,'WSPD10');
WD13=squeeze(WD13(:,:,1,13));
WD14=ncread(ncfile,'WSPD10');
WD14=squeeze(WD14(:,:,1,14));
WD15=ncread(ncfile,'WSPD10');
WD15=squeeze(WD15(:,:,1,15));
WD16=ncread(ncfile,'WSPD10');
WD16=squeeze(WD16(:,:,1,16));
WD17=ncread(ncfile,'WSPD10');
WD17=squeeze(WD17(:,:,1,17));
WD18=ncread(ncfile,'WSPD10');
WD18=squeeze(WD18(:,:,1,18));
WD19=ncread(ncfile,'WSPD10');
WD19=squeeze(WD19(:,:,1,19));
WD20=ncread(ncfile,'WSPD10');
WD20=squeeze(WD20(:,:,1,20));
WD21=ncread(ncfile,'WSPD10');
WD21=squeeze(WD21(:,:,1,21));
WD22=ncread(ncfile,'WSPD10');
WD22=squeeze(WD22(:,:,1,22));
WD23=ncread(ncfile,'WSPD10');
WD23=squeeze(WD23(:,:,1,23));
WD24=ncread(ncfile,'WSPD10');
WD24=squeeze(WD24(:,:,1,24));

%metc(:,:,1,j)=(temp1+temp2+temp3+temp4+temp5+temp6+temp7+temp8+temp9+temp10+temp11+temp12+temp13+temp14+temp15+temp16+temp17+temp18+temp19+temp20+temp21+temp22+temp23+temp24)/24;%世界时的日平均。
wind2(:,:,1,j)=WD1+WD2+WD3+WD4+WD5+WD6+WD7+WD8+WD9+WD10+WD11+WD12+WD13+WD14+WD15+WD16;%第j天的世界时前16个时刻，北京时的9-24时
wind3(:,:,1,j)=WD17+WD18+WD19+WD20+WD21+WD22+WD23+WD24;%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。
wind1(:,:,1,j)=(wind2(:,:,1,j)+wind3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，
%uwind(:,:,1,j)=(U1+U2+U3+U4+U5+U6+U7+U8+U9+U10+tU11+U12+U13+U14+U15+U16+U17+U18+U9+U20+U21+U22+U23+U24)/24;%世界时的日平均。
uwind2(:,:,1,j)=U1+U2+U3+U4+U5+U6+U7+U8+U9+U10+U11+U12+U13+U14+U15+U16;%第j天的世界时前16个时刻，北京时的9-24时
uwind3(:,:,1,j)=U17+U18+U19+U20+U21+U22+U23+U24;%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。
uwind1(:,:,1,j)=(uwind2(:,:,1,j)+uwind3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，
%vwind(:,:,1,j)=(V1+V2+V3+V4+V5+V6+V7+V8+V9+V10+V11+V12+V13+V14+V15+V16+V17+V18+V19+V20+V21+V22+V23+V24)/24;%世界时的日平均。
vwind2(:,:,1,j)=V1+V2+V3+V4+V5+V6+V7+V8+V9+V10+V11+V12+V13+V14+V15+V16;%第j天的世界时前16个时刻，北京时的9-24时
vwind3(:,:,1,j)=V17+V18+V19+V20+V21+V22+V23+V24;%第j天的世界时的后8个时刻，北京时的第j+1天的1-8时。
vwind1(:,:,1,j)=(vwind2(:,:,1,j)+vwind3(:,:,1,j-1))/24;  %%%AQ英语计算北京时的日平均，


load D:\matlab\MATLAB2014b\color3.mat;
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel1,latmodel1,wind1(:,:,1,j),32,'linestyle','none');   %使用填色图的形式画dispvar这个变量
hold on;
m_quiver(lonmodel2,latmodel2,uwind1(:,:,1,j),vwind1(:,:,1,j),10,'color','k');%以矢量箭头的方式画图，24是调节箭头大小.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %绘制省界
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %绘制市界
m_grid; 
title('wind10');

colormap(color3);
hc=colorbar; %色标
set(gca,'clim',[0 8]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','m/s','fontsize',10);  % 对色标加单位




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 suptitle(['201801',sprintf('%02d',j)]);
 print(gcf,'-dpng','-r200',['F:\graduate\毕业论文\数据\picture\预报第1天\DAYAVEmetc201801',sprintf('%02d',j)]);%输出到文件夹下。

end
end
