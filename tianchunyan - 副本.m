clear all;

ncfilelocat='D:\cmaq\mcipdata\newgrid\GRIDCRO2D_CN27EC';
lonmodel=ncread(ncfilelocat,'LON');%%%将对应个点的经度读出，储存在数组lonmodel中。
latmodel=ncread(ncfilelocat,'LAT');

% 读进去其中一天的污染物数据
concfile='D:\cmaq\mcipdata\newgrid\CONC.CN27EC_20180102';
dispvar=ncread(concfile,'PM25'); %ncread，读取nc文件。
t=1; % 每个文件第一个时次是北京时09时，第24个时次是次日08时。
dispvar=squeeze(dispvar(:,:,1,t));

m_proj('mercator','lon',[100,125],'lat',[18,43]);  %创建一个自己设定经纬度范围的绘图投影区域
m_contourf(lonmodel,latmodel,dispvar,32,'linestyle','none');  %使用填色图的形式画dispvar这个变量
m_plotbndry('D:\projects\matlab\m_map\shengjie','color','k','linewidth',1.5);  %绘制省界
% m_plotbndry('D:\projects\matlab\m_map\diqujie','color','k','linewidth',1); %绘制市界
m_grid; 
hc=colorbar; %色标
set(gca,'clim',[0 300]);  %设定绘图要素的取值范围
set(get(hc,'ylabel'),'String','μg cm^-^3','fontsize',20);  % 对色标加单位
