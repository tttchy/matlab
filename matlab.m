A=zeros(73,1);可使single类型数据变成double。
A=zeros(73,9); %建立一个73列9行的数组。
Findpoint的使用，必须要有脚本文件
未定义与 'single' 类型的输入参数相对应的函数 'findpoint'，一般出现这种提示表示需要该函数的脚本文件或者文件夹。
temp=squeeze(temp(:,:,1,t)); %squeeze函数用于删除矩阵种的单一维，如使用后，将变为temp（:,:,t),主要用于二维以上数组。

赋值具有的非单一 rhs 维度多于非单一下标数 
后发现这是矩阵因维数不同导致不能相乘的缘故。
没有确定数组应该对应的大小

Matlab 中中出现NaN，意思是Not a Number. 0/0, ∞/ ∞, 0× ∞等运算都会产生NaN
Matlab用NAN来真实记录0/0, ∞/ ∞, 0× ∞等运算的后果，避免可能因上述计算而造成的程序执行的中断。当出现计算0/0时，不会报错，但是结算得到的结果就是NaN
