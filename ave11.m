clear all;

ncfilelocat='F:\graduate\毕业论文\数据\GRIDCRO2D_CN09GD';
lonmodel=ncread(ncfilelocat,'LON');
latmodel=ncread(ncfilelocat,'LAT');
% 读进去其中一天的污染物数据
A=zeros(24,3);
for k=01:01 %用于读取不同的文件夹
for j=k+1:k+3     %读取上一文件夹下的文件
    ncfile=['I:\cmaqout\tianchunyan\201801',sprintf('%02d',k),'\CONC.CN09GD_201801',sprintf('%02d',j)] %读不同文件下的不同文件%！！！！改改改！！！！！！！！
for i=1:24 % 每个文件第一个时次是北京时09时，第24个时次是次日08时。
temp=ncread(ncfile,'PM25');
temp=squeeze(temp(:,:,1,i));

[x1,y1]=findpoint(113.235,23.1422,lonmodel,latmodel); %读取对应经纬度的格点数据
[x2,y2]=findpoint(113.261,23.105,lonmodel,latmodel);
[x3,y3]=findpoint(113.348,23.0916,lonmodel,latmodel);
[x4,y4]=findpoint(113.433,23.105,lonmodel,latmodel);
[x5,y5]=findpoint(113.352,22.9477,lonmodel,latmodel);
[x6,y6]=findpoint(113.215,23.3917,lonmodel,latmodel);
[x7,y7]=findpoint(113.26,23.1331,lonmodel,latmodel);
[x8,y8]=findpoint(113.568,23.2783,lonmodel,latmodel);
[x9,y9]=findpoint(113.281,23.1569,lonmodel,latmodel);
[x10,y10]=findpoint(113.589,23.5538,lonmodel,latmodel);

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
A(i,j-1)=mean(tmpmean); %对以上格点求平均值


end
end
A
% xlswrite('F:\graduate\毕业论文\数据\picture\avetime.xlsx',A)
filename=['F:\graduate\毕业论文\数据\picture\201801',sprintf('%02d',k),'\avetime.xlsx']
xlswrite(filename,A,'sheet1','A:C')%保存到exce文件中去
end
