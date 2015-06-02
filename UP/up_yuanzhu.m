% 两个水平圆柱体剖面Za异常向上延拓
% 重点理解向上延拓的作用和计算误差来源。

clc;
clear;

% 测点分布范围
dx=5; % X方向测点间距 m
nx=101; % X方向测点数
xmin=-250; % X方向起点 m
x=xmin:dx:(xmin+(nx-1)*dx); % X方向范围 m

% 两个水平圆柱体参数
i=pi/2;  %有效磁化倾角is
I=pi/3; %地磁倾角
R1=10; % 水平圆柱体1半径 m
L1=30; % 水平圆柱体1走向长度 m
R2=30; % 水平圆柱体2半径 m
L2=30; % 水平圆柱体2走向长度 m
v1=pi*R1^2;
v2=pi*R2^2;
u=4*pi*10^(-7);  %磁导率
M=0.7;   %磁化强度 A/m
m1=M*v1;   %磁矩
m2=M*v2;   %磁矩
D1=20; % 水平圆柱体1埋深 m
D2=50; % 水平圆柱体2埋深 m

% 柱体1理论磁异常
Za1=(u*m1*((D1.^2-(x-50).^2)*sin(i)-2*D1*(x-50).*cos(i)))./(2*pi*((x-50).^2+D1.^2).^2);
Ha1=-u*m1*((D1.^2-(x-50).^2)*cos(i)+2*D1*(x-50).*sin(i))./(2*pi*((x-50).^2+D1.^2).^2);
deltT1=u*m1*sin(I)*((D1^2-(x-50).^2)*cos(2*i-pi/2)-2*D1*(x-50).*cos(2*i-pi/2))./((2*pi*(x-50).^2+D1^2).^2*sin(i));
% 柱体2理论磁异常
Za2=(u*m2*((D2.^2-(x+50).^2)*sin(i)-2*D2*(x+50).*cos(i)))./(2*pi*((x+50).^2+D2.^2).^2);
Ha2=-(u*m2*((D2.^2-(x+50).^2)*cos(i)+2*D2*(x+50).*sin(i)))./(2*pi*((x+50).^2+D2.^2).^2);
deltT2=u*m2*sin(I)*((D2^2-(x+50).^2)*cos(2*i-pi/2)-2*D2*(x+50).*cos(2*i-pi/2))./(2*pi*((x+50).^2+D2^2).^2*sin(i));

%两个水平圆柱体的理论磁异常
Za=Za1+Za2;
Ha=Ha1+Ha2;
deltT=deltT1+deltT2;


h=1; % 延拓高度 5m
%h=2; % 延拓高度 10m
n=10; % 级数，即参与积分的区间段（积分点数-1）/2

% Za Ha 向上延拓
Zau1=zeros(1,nx); % 上延后异常值，先赋空值
Hau1=zeros(1,nx); % 上延后异常值，先赋空值
Tu1=zeros(1,nx);
for i=(h*n+1):(nx-h*n)
    tmp_za=0;
    tmp_ha=0;
    tmp_t=0;
    for j=(i-h*n):h:(i+h*n)
        k=(j-i)/h;      % 参与积分的区间段（积分点数-1）/2
        tmp_za=tmp_za+Za(j)*atan(4/(4*k*k+3))/pi;
        tmp_ha=tmp_ha+Ha(j)*atan(4/(4*k*k+3))/pi;
        tmp_t=tmp_t+deltT(j)*atan(4/(4*k*k+3))/pi;
    end
    Zau1(i)=tmp_za; % 上延后异常值
    Hau1(i)=tmp_ha;
    Tu1(i)=tmp_t;
end

figure(1),plot(x,Za,'b',x,Zau1,'r:'),xlabel('X (m)'),ylabel('Za磁异常(nT.)'),legend('原始异常','n=10上延异常',n),title('向上延拓Za磁异常(5m)');
figure(2),plot(x,Ha,'b',x,Hau1,'r:'),xlabel('X (m)'),ylabel('Ha磁异常(nT.)'),legend('原始异常','n=10上延异常',n),title('向上延拓Ha磁异常(5m)');
figure(3),plot(x,deltT,'b',x,Tu1,'r:'),xlabel('X (m)'),ylabel('ΔT磁异常(nT.)'),legend('原始异常','n=10上延异常',n),title('向上延拓ΔT磁异常(5m)');

