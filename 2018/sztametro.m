
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%读取一个广州塔和深圳塔经纬度坐标，被找到其对应位置的eta每一层所对应的高度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
ncfilelocat='D:\wrfout\eta7\wrfout_bep7';
lonmodel=ncread(ncfilelocat,'XLONG');%%%将对应个点的经度读出，储存在数组lonmodel中。
latmodel=ncread(ncfilelocat,'XLAT');
lonmodel=lonmodel(:,:,1,1);%%%%由于这里的经纬度数据是四维的，所以要改变成2重。这里没有用到squeeze函数貌似也可以变为2维。
latmodel=latmodel(:,:,1,1);

Tsz=zeros(11,1);
Usz=zeros(11,1);
Vsz=zeros(11,1);
ncfile='D:\wrfout\eta7\wrfout_bep7';%读不同文件下的不同文件 
t0=1;

for t=37;
for z=1:11 ; % t=1是世界时0时刻，北京时08时，第24个时次是次日07时。
psz=ncread(ncfile,'P');
psz=squeeze(psz(:,:,z,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
[x1,y1]=findpoint(113.906597,22.653169,lonmodel,latmodel); %深圳塔经纬度
psz=psz(x1,y1);  %读取该格点的值

pbsz=ncread(ncfile,'PB');
pbsz=squeeze(pbsz(:,:,z,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
[x1,y1]=findpoint(113.906597,22.653169,lonmodel,latmodel);  
pbsz=pbsz(x1,y1);  %读取该格点的值
    
tsz=ncread(ncfile,'T');
tsz=squeeze(tsz(:,:,z,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
[x1,y1]=findpoint(113.906597,22.653169,lonmodel,latmodel);  
tsz=tsz(x1,y1);  %读取该格点的值
Tsz(z,t0)=(tsz+300)*((psz+pbsz)/100000)^0.2854-273.15; %convert perturbation potential temperature into temperature


phbsz=ncread(ncfile,'U');
phbsz=squeeze(phbsz(:,:,z,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
[x1,y1]=findpoint(113.906597,22.653169,lonmodel,latmodel); 
phbsz=phbsz(x1,y1);  %读取该格点的值
Usz(z,t0)=phbsz;

hgtsz=ncread(ncfile,'V');
hgtsz=squeeze(hgtsz(:,:,z,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
[x1,y1]=findpoint(113.906597,22.653169,lonmodel,latmodel); 
hgtsz=hgtsz(x1,y1);  %读取该格点的值
Vsz(z,t0)=hgtsz;
%B(z,t)=(ph+phb)/9.81-hgt; %convert eta into altitude 
end
end
