num=[0.1 0.03 -0.07];den=[1 -2.7 2.42 -0.72];
sys=tf(num,den);
%ת���㼫����ʽ
sys1=zpk(sys);
%�����㼫���һ��Բ
pzmap(sys);
%ת��״̬�ռ���ʽ
gss=ss(sys1);
%��������
eigen=eig(sys);
%����������ʽ
P=poly(eigen);
%ת�ɴ���ʽ
z=poly2str(P,'z');