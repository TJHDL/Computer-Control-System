% e1(t) = sin(2*pi*t)
% fs = 10Hz  N=10  T=0.1s Nyquist_f=2Hz
clf;

%2.3.3 a 连续周期信号幅值谱
fs = 10; %采样频率为10Hz
t = 0:1/fs:0.9; %采样时间为一个周期
e1 = sin(2*pi*t); %信号
N = size(e1,2); %数据点数 2对应矩阵的列数->10
y1 = fft(e1,N); %信号的快速傅里叶变换
f1 = (0:N-1)*fs/N; %频率序列
mag1 = abs(y1)*2/N; %求取幅值 abs()计算幅值 求取Fourier变换的振幅,其中*2/N转变为真实幅值
subplot(3,1,1),plot(f1,mag1);
xlabel('频率/Hz');
ylabel('振幅');
grid on;
title('e1(t)=sin(2\pit)'); %做出幅频图

%因为实信号以fs为采样速率的信号在 s/2处混叠，所以实信号fft的结果中前半部分对应[0,fs/2],后半部分对应[-fs/2, 0]
%大于fs/2的部分的频谱实际上是实信号的负频率加fs的结果。
%故要得到正确的结果，只需将视在频率减去fs即可得到频谱对应的真实负频率
%如果要让实信号fft的结果与[-fs/2, fs/2]对应，则要fft后fftshift一下即可
y2 = fftshift(y1); %将fft结果以fs/2为中心左右互换 将零频点移到频谱中间
f2 = (0:N-1)*fs/N-fs/2; %将真实频率减去fs/2
mag2 = abs(y2)*2/N*fs; %乘1/T
subplot(3,1,2),plot(f2,mag2);
xlabel('频率/Hz');
ylabel('幅值');
grid on;
title('e1(t)=sin(2\pit)，周期信号幅值谱')

%2.3.3 b 采样离散信号幅值谱
%离散时间信号的幅值谱
y3 = [abs(y1),abs(y1),abs(y1)]*fs; %周期延拓至0：1：29 乘1/T
mag3 = y3*2/N;
subplot(3,1,3),plot(0:1:29,mag3);
xlabel('频率/Hz');
ylabel('幅值');
grid on;
title('e1(t)=sin(2\pit),被周期采样后，离散信号的幅值谱')
