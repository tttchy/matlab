imread('F:\Program Files\MATLAB\R2014b\colorcolor\landuse.png')   % �õ���һ��23*183*3�ľ�������23�ǿ��ߣ���183�ǳ���3��RGB��ά��
landuse=ans(12,:,:)    %  �õ��м�һ������ɫ��Ϣ
colorfinal=reshape(landuse,687,3);   %  ���õ��м�һ��ÿ�����RGB
colormap(double(colorfinal)/255)    %  ��Ҫת����˫���ȣ�0-1֮�����ֵ
colorbar  %����һ��ɫ��
landuse=double(colorfinal)/255;%����Ӧ�����ֵĹ����������Ϊmat�ļ���
%save colorsave bluered3 �CASCII;  %������ɫ�����Ϊ.mat�ļ���������滭ͼ���á�
