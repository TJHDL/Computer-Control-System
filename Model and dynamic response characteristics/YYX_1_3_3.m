num=[2 -2.2 0.56];
den=[1 -0.6728 0.0463 0.4860];
T=1;
GZ=tf(num,den,T);
% a �� residue ����� G(z)/z ���в�����ʽչ������������ A �ͼ��� p ���ü�
% ������ʽ��ʾ(why?)������ z ƽ���б����ͬʱ��һ����λԲ��
[r,p,k]=residue(num,[den,0]);
rr=abs(r);
thr=angle(r);
rp=abs(p);
thp=angle(p);
% syms z;
pzmap(GZ);
hold on;
ezplot x^2+y^2-1;
axis([-1.5,1.5,-1.5,1.5]);
axis equal
hold off;

% b Ϊ��ʽ�ֽ��� G(z)��ÿһ��������ʽ���뵥λ�弤�źţ���ͼ��ʾ�ɸ�
% ����ʽ�еļ����������ʱ����Ӧ��

% ������
sys1=tf([r(1)+r(2),-(r(1)*p(2)+r(2)*p(1)),0],[1,-(p(1)+p(2)),p(1)*p(2)],1);
[y1,k1]=impulse(sys1);
figure(2);
stem(k1,y1,'filled','g');
hold on;

% ʵ����
sys2=tf([r(3),0],[1,-p(3)],1);
[y2,k2]=impulse(sys2);
stem(k2,y2,'filled','b');

sys3=tf([r(4),0],[1,-p(4)],1);
[y3,k3]=impulse(sys3);
stem(k3,y3,'filled','y');
hold off;

% d �����뵥λ�弤�ź�ʱ����ͼ��ʾϵͳ�������Ӧ���Ƚϸ�������弤��
% Ӧ֮����ϵͳ�ĳ弤��Ӧ����˵��ԭ��
figure
[y,q]=impulse(GZ);
stem(q,y,'filled');

% c ��ͬ����

% ʵ����
figure
for i=1:9
    p=0.5*i-2;
    subplot(2,9,i);
    sys4=tf([r(3),0],[1,-p],1);
    [y4,k4]=impulse(sys4);
    stem(k4,y4,'filled');
    axis([0,10,-10,10]);
    str=['p= ',num2str(p)];
    title(str);
end

% ������
b=[0.2,0.4,0.6,0.8,1,0.8,0.6,0.4,0.2];
for i=1:9
    a=0.3*i-1.2;
    p1=a+b(i)*1i;
    p2=a-b(i)*1i;
    subplot(2,9,i+9);
    sys4=tf([r(1)+r(2),-(r(1)*p2+r(2)*p1),0],[1,-(p1+p2),p1*p2],1);
    [y4,k4]=impulse(sys4);
    stem(k4,y4,'filled');
    axis([0,10,-2,2]);
    str=['p=',num2str(a),'+/-',num2str(b(i)),'i'];
    title(str);
end
