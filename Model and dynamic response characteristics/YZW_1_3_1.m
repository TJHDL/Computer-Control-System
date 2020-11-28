num=[0.1 0.03 -0.07];den=[1 -2.7 2.42 -0.72];
sys=tf(num,den);
%转成零极点形式
sys1=zpk(sys);
%画出零极点和一个圆
pzmap(sys);
%转成状态空间形式
gss=ss(sys1);
%求特征根
eigen=eig(sys);
%求特征多项式
P=poly(eigen);
%转成代数式
z=poly2str(P,'z');