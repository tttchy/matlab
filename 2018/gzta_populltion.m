
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%读取一个广州塔和深圳塔经纬度坐标，被找到其对应位置的eta每一层所对应的高度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
ncfilelocat='D:\wrfout\eta7\wrfout_bep7';
lonmodel=ncread(ncfilelocat,'XLONG');%%%将对应个点的经度读出，储存在数组lonmodel中。
latmodel=ncread(ncfilelocat,'XLAT');
lonmodel=lonmodel(:,:,1,1);%%%%由于这里的经纬度数据是四维的，所以要改变成2重。这里没有用到squeeze函数貌似也可以变为2维。
latmodel=latmodel(:,:,1,1);

no2gz=zeros(11,1);
pm25gz=zeros(11,1);
o3gz=zeros(11,1);

ncfile='D:\wrfout\eta7\wrfout_bep7';%读不同文件下的不同文件%！！！！改改改！！！！！！！！
t0=1;
for t=19;
for z=1:11  % t=1是世界时0时刻，北京时08时，第24个时次是次日07时。

tgz=ncread(ncfile,'no2');
tgz=squeeze(tgz(:,:,z,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
[x1,y1]=findpoint(113.335301,23.116757,lonmodel,latmodel); %广州塔经纬度
tgz=tgz(x1,y1);  %读取该格点的值
no2gz(z,t0)=tgz*2.05*1000; %单位由ppmv转变为ug/m^3

phbgz=ncread(ncfile,'PM2_5_DRY');
phbgz=squeeze(phbgz(:,:,z,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
[x1,y1]=findpoint(113.335301,23.116757,lonmodel,latmodel); %广州塔经纬度
phbgz=phbgz(x1,y1);  %读取该格点的值
pm25gz(z,t0)=phbgz;

hgtgz=ncread(ncfile,'o3');
hgtgz=squeeze(hgtgz(:,:,z,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
[x1,y1]=findpoint(113.335301,23.116757,lonmodel,latmodel); %广州塔经纬度
hgtgz=hgtgz(x1,y1);  %读取该格点的值
o3gz(z,t0)=hgtgz*2.14*1000;
%A(z,t)=(ph+phb)/9.81-hgt; 求不同时刻不同层数的位势高度
end
end



