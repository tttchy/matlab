
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%对珠三角的9大城市的各国控站点的对应经纬度的数据求平均得到该城市的污染物气象场资料。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
ncfilelocat='D:\wrfout\wrfout-ucm-4-7';
lonmodel=ncread(ncfilelocat,'XLONG');%%%将对应个点的经度读出，储存在数组lonmodel中。
latmodel=ncread(ncfilelocat,'XLAT');
lonmodel=lonmodel(:,:,1,1);%%%%由于这里的经纬度数据是四维的，所以要改变成2重。这里没有用到squeeze函数貌似也可以变为2维。
latmodel=latmodel(:,:,1,1);

A=zeros(73,9); %建立一个73列9行的数组。

ncfile='D:\wrfout\wrfout-nourban-4-7';%读不同文件下的不同文件%！！！！改改改！！！！！！！！

for t=1:73  % t=1是世界时0时刻，北京时08时，第24个时次是次日07时。
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。
%读取广州国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(113.235,23.1422,lonmodel,latmodel); 
[x2,y2]=findpoint(113.261,23.105,lonmodel,latmodel);
[x3,y3]=findpoint(113.348,23.0916,lonmodel,latmodel);
[x4,y4]=findpoint(113.433,23.105,lonmodel,latmodel);
[x5,y5]=findpoint(113.352,22.9477,lonmodel,latmodel);
[x6,y6]=findpoint(113.215,23.3917,lonmodel,latmodel);
[x7,y7]=findpoint(113.26,23.1331,lonmodel,latmodel);
[x8,y8]=findpoint(113.568,23.2783,lonmodel,latmodel);
[x9,y9]=findpoint(113.281,23.1569,lonmodel,latmodel);
[x10,y10]=findpoint(113.589,23.5538,lonmodel,latmodel);
[x11,y11]=findpoint(113.3215,23.131,lonmodel,latmodel); 
tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2); 
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
tmpmean(5)=temp(x5,y5);
tmpmean(6)=temp(x6,y6);
tmpmean(7)=temp(x7,y7);
tmpmean(8)=temp(x8,y8);
tmpmean(9)=temp(x9,y9);
tmpmean(10)=temp(x10,y10);
tmpmean(11)=temp(x11,y11);
A(t,1)=mean(tmpmean); %对以上格点求平均值
end
for t=1:73
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t));
%读取肇庆国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(112.5653,23.1617,lonmodel,latmodel); 
[x2,y2]=findpoint(112.4708,23.0528,lonmodel,latmodel);
[x3,y3]=findpoint(112.4266,23.0705,lonmodel,latmodel);
[x4,y4]=findpoint(112.4722,23.0786,lonmodel,latmodel);
tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2);
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
A(t,2)=mean(tmpmean); %对以上格点求平均值
end

for t=1:73
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t));
%读取%中山国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(113.4336,22.4886,lonmodel,latmodel); 
[x2,y2]=findpoint(113.4017,22.5078,lonmodel,latmodel);
[x3,y3]=findpoint(113.3689,22.5211,lonmodel,latmodel);
[x4,y4]=findpoint(113.365,22.5481,lonmodel,latmodel);
tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2);
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
A(t,3)=mean(tmpmean); %对以上格点求平均值
end

for t=1:73
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t));
%读取珠海国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(113.2989,22.2281,lonmodel,latmodel); 
[x2,y2]=findpoint(113.5736,22.2611,lonmodel,latmodel);
[x3,y3]=findpoint(113.4946,22.2294,lonmodel,latmodel);
[x4,y4]=findpoint(113.6283,22.425,lonmodel,latmodel);
tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2);
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
A(t,4)=mean(tmpmean); %对以上格点求平均值
end
for t=1:73
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t));
%读取%东莞国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(113.7944,23.0128,lonmodel,latmodel); 
[x2,y2]=findpoint(113.7819,23.0536,lonmodel,latmodel);
[x3,y3]=findpoint(113.7461,23.0278,lonmodel,latmodel);
[x4,y4]=findpoint(113.7383,22.9658,lonmodel,latmodel);
[x5,y5]=findpoint(113.7481,23.06,lonmodel,latmodel);
tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2);
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
tmpmean(5)=temp(x5,y5);
A(t,5)=mean(tmpmean); %对以上格点求平均值
end
for t=1:73
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t));
%读取%惠州国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(114.4204,23.0428,lonmodel,latmodel); 
[x2,y2]=findpoint(114.4131,23.1091,lonmodel,latmodel);
[x3,y3]=findpoint(114.4102,23.0832,lonmodel,latmodel);
[x4,y4]=findpoint(114.5297,22.7273,lonmodel,latmodel);
[x5,y5]=findpoint(114.477,22.7833,lonmodel,latmodel);
tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2);
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
tmpmean(5)=temp(x5,y5);
A(t,6)=mean(tmpmean); %对以上格点求平均值
end
for t=1:73
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t));
%读取%江门国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(113.1036,22.6069,lonmodel,latmodel); 
[x2,y2]=findpoint(113.0819,22.5931,lonmodel,latmodel);
[x3,y3]=findpoint(113.0739,22.5811,lonmodel,latmodel);
[x4,y4]=findpoint(113.0244,22.5325,lonmodel,latmodel);
tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2);
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
A(t,7)=mean(tmpmean); %对以上格点求平均值
end

for t=1:73
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t));
%读取%深圳国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(114.085,22.75,lonmodel,latmodel); %读取对应经纬度的格点数据
[x2,y2]=findpoint(113.891,22.5794,lonmodel,latmodel);
[x3,y3]=findpoint(113.9872,22.5417,lonmodel,latmodel);
[x4,y4]=findpoint(114.0958,22.55,lonmodel,latmodel);
[x5,y5]=findpoint(114.41,22.6342,lonmodel,latmodel);
[x6,y6]=findpoint(114.24,22.7267,lonmodel,latmodel);
[x7,y7]=findpoint(114.494,22.5422,lonmodel,latmodel);
[x8,y8]=findpoint(114.1167,22.5625,lonmodel,latmodel);
[x9,y9]=findpoint(113.9231,22.5167,lonmodel,latmodel);
[x10,y10]=findpoint(114.297,22.5978,lonmodel,latmodel);
[x11,y11]=findpoint(114.2631,22.5908,lonmodel,latmodel); 
tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2);
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
tmpmean(5)=temp(x5,y5);
tmpmean(6)=temp(x6,y6);
tmpmean(7)=temp(x7,y7);
tmpmean(8)=temp(x8,y8);
tmpmean(9)=temp(x9,y9);
tmpmean(10)=temp(x10,y10);
tmpmean(11)=temp(x11,y11);
A(t,8)=mean(tmpmean); %对以上格点求平均值
end
for t=1:73
temp=ncread(ncfile,'PM2_5_DRY');
temp=squeeze(temp(:,:,1,t));
%读取佛山国控站点对应经纬度的格点数据 
[x1,y1]=findpoint(113.1,23.0422,lonmodel,latmodel); 
[x2,y2]=findpoint(113.1341,23.0048,lonmodel,latmodel);
[x3,y3]=findpoint(113.8366,22.8822,lonmodel,latmodel);
[x4,y4]=findpoint(113.1403,23.0494,lonmodel,latmodel);
[x5,y5]=findpoint(112.8858,22.1664,lonmodel,latmodel);
[x6,y6]=findpoint(112.8603,23.1886,lonmodel,latmodel);
[x7,y7]=findpoint(113.2531,22.7656,lonmodel,latmodel);
[x8,y8]=findpoint(113.2878,22.8094,lonmodel,latmodel);

tmpmean(1)=temp(x1,y1);  %读取该格点的值
tmpmean(2)=temp(x2,y2);
tmpmean(3)=temp(x3,y3);
tmpmean(4)=temp(x4,y4);
tmpmean(5)=temp(x5,y5);
tmpmean(6)=temp(x6,y6);
tmpmean(7)=temp(x7,y7);
tmpmean(8)=temp(x8,y8);
A(t,9)=mean(tmpmean); %对以上格点求平均值
end
% xlswrite('F:\graduate\毕业论文\数据\picture\avetime.xlsx',A)
%filename=['F:\graduate\毕业论文\数据\picture\201801',sprintf('%02d',k),'\avetime.xlsx']
%xlswrite(filename,A,'sheet1','A:C')%保存到exce文件中去

