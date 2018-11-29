imread('F:\Program Files\MATLAB\R2014b\colorcolor\landuse.png')   % 得到了一个23*183*3的矩阵，其中23是宽（高），183是长，3是RGB的维数
landuse=ans(12,:,:)    %  得到中间一条的颜色信息
colorfinal=reshape(landuse,687,3);   %  最后得到中间一条每个点的RGB
colormap(double(colorfinal)/255)    %  需要转化成双精度，0-1之间的数值
colorbar  %画出一个色标
landuse=double(colorfinal)/255;%将对应的名字的工作区的另存为mat文件。
%save colorsave bluered3 –ASCII;  %将所得色标另存为.mat文件，方便后面画图引用。
