clc;
clear;

% 测点分布范围
dx=5; % X方向测点间距-
nx=81; % X方向测点数-
xmin=-200; % X方向起点-
x=xmin:dx:(xmin+(nx-1)*dx); % X方向范围 

u=4*pi*10^(-7);  %磁导率
i=pi/3;  %有效磁化倾角is
a=0; %剖面磁方位角
T=50000;%地磁场T=50000nT

% 球体参数
R1=10; % 球体半径 m
D1=30; % 球体埋深 m
v1=4*pi*R1^3;
k=0.2; %磁化率
M1=k*T/u;  %磁化强度 A/m
m1=M1*v1;   %磁矩

% 球体 理论磁异常主剖面
%(x-0),(y-0)
y=0;
Za0=(u*m1*((2*D1.^2-x.^2-y.^2)*sin(i)-3*D1*x.*cos(i)*cos(a)-3*D1*y.*cos(i)*sin(a)))./(4*pi*(x.^2+y.^2+D1.^2).^(5/2));

plot(x,Za0),ylabel('Za/nT'),title('理论球体Za异常主剖面图');
zMax=-10000;
zMin=10000;
xMax=0;
xMin=0;
for i=1:nx
    if Za0(i)>zMax
        zMax=Za0(i);
        xMax=i;
    end
    if Za0(i)<zMin
        zMin=Za0(i);
        xMin=i;
    end
end
%转化为以米为单位的坐标
xMax=xmin+(xMax-1)*dx;
xMin=xmin+(xMin-1)*dx;
%dm=R/f
dm=xMin-xMax;
km=abs(zMin)/zMax;

k=[1 0.52 0.29 0.15 0.1 0.04 0.02];
f=[1 0.98 0.92 0.83 0.72 0.61 0.5];
phi=[0.43 0.56 0.7 0.82 0.92 0.98 1];
is=[0 15 30 45 60 75 90];
fi=interp1(k,f,km)
phi_i=interp1(k,phi,km)
is_i=interp1(k,is,km)
%埋深
R=dm*fi
ms=(2*pi*R^3*zMax)/(u*phi_i)



    
    
    
    
    