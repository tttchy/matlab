clear all;

ncfilelocat='D:\cmaq\mcipdata\newgrid\GRIDCRO2D_CN27EC';
lonmodel=ncread(ncfilelocat,'LON');%%%����Ӧ����ľ��ȶ���������������lonmodel�С�
latmodel=ncread(ncfilelocat,'LAT');

% ����ȥ����һ�����Ⱦ������
concfile='D:\cmaq\mcipdata\newgrid\CONC.CN27EC_20180102';
dispvar=ncread(concfile,'PM25'); %ncread����ȡnc�ļ���
t=1; % ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��
dispvar=squeeze(dispvar(:,:,1,t));

m_proj('mercator','lon',[100,125],'lat',[18,43]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel,latmodel,dispvar,32,'linestyle','none');  %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\projects\matlab\m_map\shengjie','color','k','linewidth',1.5);  %����ʡ��
% m_plotbndry('D:\projects\matlab\m_map\diqujie','color','k','linewidth',1); %�����н�
m_grid; 
hc=colorbar; %ɫ��
set(gca,'clim',[0 300]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','��g cm^-^3','fontsize',20);  % ��ɫ��ӵ�λ
