clear all;

ncfilelocat1='F:\graduate\��ҵ����\����\GRIDCRO2D_CN09GD';
ncfilelocat2='F:\graduate\��ҵ����\����\GRIDDOT2D_CN09GD';
lonmodel1=ncread(ncfilelocat1,'LON');%��ȡ��ά����Ҫ�صľ������ݡ�
latmodel1=ncread(ncfilelocat1,'LAT');
lonmodel2=ncread(ncfilelocat2,'LOND');%��ȡ��ά�糡�ľ�������
latmodel2=ncread(ncfilelocat2,'LATD');
% ���������󳡻���ͬһ��ͼ��
for k=01:25  %���ڶ�ȡ��ͬ���ļ���
for j=k+1     %%�������������ĸĸģ���������������
    ncfile1=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METCRO2D.CN09GD_201801',sprintf('%02d',j)] %����ͬ�ļ��µĲ�ͬ�ļ�%���������ĸĸģ���������������
    ncfile2=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\METDOT3D.CN09GD_201801',sprintf('%02d',j)]
for i=1:24 % ÿ���ļ���һ��ʱ���Ǳ���ʱ09ʱ����24��ʱ���Ǵ���08ʱ��


subplot(2,2,1);%��ͼ�δ��ڷָ�� m��n��,������p��ָ�����Ӵ���Ϊ��ǰ���ڡ��Ӵ��ڰ����������ң��������½��б�š���һ������M AT L A B�ĵ�ǰ�汾��Ҳ��д��s u b p l o t ( m n p )��
temp=ncread(ncfile1,'Q2');
temp=squeeze(temp(:,:,1,i));
load D:\matlab\MATLAB2014b\color3.mat
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,temp,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('Q2');  %��ͼ�ϵı���
colormap(color3);
hc=colorbar; %ɫ��

set(gca,'clim',[0.003 0.012]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','kg/kg','fontsize',10);  % ��ɫ��ӵ�λ


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2);
temp=ncread(ncfile1,'PBL');
temp=squeeze(temp(:,:,1,i));
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,temp,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('PBL');  %��ͼ�ϵı���
hc=colorbar; %ɫ��
set(gca,'clim',[0 1100]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','m','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3);
temp=ncread(ncfile1,'TEMP2');
temp=squeeze(temp(:,:,1,i));
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,temp-273.15,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('TEMP2');  %��ͼ�ϵı���
hc=colorbar; %ɫ��
set(gca,'clim',[10 23]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','��','fontsize',10);  % ��ɫ��ӵ�λ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
subplot(2,2,4);
%temp=ncread(ncfile1,'PRSFC');
%temp=squeeze(temp(:,:,1,i));
%m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
%m_contourf(lonmodel1,latmodel1,temp/100,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
%m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
%m_grid; 
%title('PRSFC');  %��ͼ�ϵı���
%hc=colorbar; %ɫ��
%set(gca,'clim',[985 1025]);  %�趨��ͼҪ�ص�ȡֵ��Χ
%set(get(hc,'ylabel'),'String','hPa','fontsize',10);  % ��ɫ��ӵ�λ

U=ncread(ncfile2,'UWIND');
V=ncread(ncfile2,'VWIND');
U=squeeze(U(:,:,7,i));
V=squeeze(V(:,:,7,i));
temp=ncread(ncfile1,'WSPD10');
temp=squeeze(temp(:,:,1,i));
load D:\matlab\MATLAB2014b\color3.mat
m_proj('mercator','lon',[112.85,114.2],'lat',[22.37,24.1]);  %����һ���Լ��趨��γ�ȷ�Χ�Ļ�ͼͶӰ����
m_contourf(lonmodel1,latmodel1,temp,32,'linestyle','none');   %ʹ����ɫͼ����ʽ��dispvar�������
hold on
m_quiver(lonmodel2,latmodel2,U,V,10,'color','k');%��ʸ����ͷ�ķ�ʽ��ͼ��24�ǵ��ڼ�ͷ��С.
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\diqujie','color','k','linewidth',1.5);  %����ʡ��
m_plotbndry('D:\matlab\MATLAB2014b\m_map_chn\m_map\xianjie','color','k','linewidth',0.3); %�����н�
m_grid; 
title('wind10');

colormap(color3);
hc=colorbar; %ɫ��
set(gca,'clim',[0 8]);  %�趨��ͼҪ�ص�ȡֵ��Χ
set(get(hc,'ylabel'),'String','m/s','fontsize',10);  % ��ɫ��ӵ�λ




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(j==k+1)
    if(i<17)
    str=sprintf('%02d',i+8);
    suptitle(['201801',sprintf('%02d',j),'/',str])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\q201801',sprintf('%02d',j),str]); %%�������������ĸĸģ���������������
    else
    str=sprintf('%02d',i-16);
     suptitle(['201801',sprintf('%02d',j+1),'/',str])  %���ֿ������ܱ���
    print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����1��\q201801',sprintf('%02d',j+1),str]);%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
    end
end
if(j==k+2)
   if(i<17)
   str=sprintf('%02d',i+8);
   suptitle(['201801',sprintf('%02d',j),'/',str])  %���ֿ������ܱ���
   print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����2��\201801',sprintf('%02d',j),str]); %%�������������ĸĸģ���������������
   else
   str=sprintf('%02d',i-16);
   suptitle(['201801',sprintf('%02d',j+1),'/',str])  %���ֿ������ܱ���
   print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����2��\201801',sprintf('%02d',j+1),str]);%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
   end
end
if(j==k+3)
   if(i<17)
   str=sprintf('%02d',i+8);
   suptitle(['201801',sprintf('%02d',j-31),'/',str])  %���ֿ������ܱ���
   print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����3��\201801',sprintf('%02d',j-31),str]); %%�������������ĸĸģ���������������
   else
   str=sprintf('%02d',i-16);
   suptitle(['201801',sprintf('%02d',j+1-31),'/',str])  %���ֿ������ܱ���
   print(gcf,'-dpng','-r200',['F:\graduate\��ҵ����\����\picture\Ԥ����3��\201801',sprintf('%02d',j+1-31),str]);%���浽��ͬ���ļ����� %%�������������ĸĸģ���������������
   end    
end

end
end
end