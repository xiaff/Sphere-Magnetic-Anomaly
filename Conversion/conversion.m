% 两个水平圆柱体剖面Za与Ha的互相转换

clc;
clear;

% 测点分布范围
dx=5; % X方向测点间距 m
nx=101; % X方向测点数
xmin=-250; % X方向起点 m
x=xmin:dx:(xmin+(nx-1)*dx); % X方向范围 m

% 两个水平圆柱体参数
i=pi/2;  %有效磁化倾角is
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
% 柱体2理论磁异常
Za2=(u*m2*((D2.^2-(x+50).^2)*sin(i)-2*D2*(x+50).*cos(i)))./(2*pi*((x+50).^2+D2.^2).^2);
Ha2=-(u*m2*((D2.^2-(x+50).^2)*cos(i)-2*D2*(x+50).*sin(i)))./(2*pi*((x+50).^2+D2.^2).^2);

%两个水平圆柱体的理论磁异常
Za=Za1+Za2;
Ha=Ha1+Ha2;

e=1:10;
a=[0.4286 0.1749 0.1103 0.0813 0.0645 0.0536 0.0458 0.04 0.0355 0.1759];

% Za 转换 Ha
% Ha 转换 Za
Ha_conversion=zeros(1,nx);
Za_conversion=zeros(1,nx);
for i=11:nx-10
    tmp_ha=0;
    tmp_za=0;
    if(i<=nx/2)
        for j=1:10
            tmp_ha=tmp_ha+a(j)*(Za(i-j)-Za(i+j));
            tmp_za=tmp_za+a(j)*(Ha(i-j)-Ha(i+j));
        end
    else
        for j=1:10
            tmp_ha=tmp_ha+a(j)*(Za(i+j)-Za(i-j));
            tmp_za=tmp_za+a(j)*(Ha(i+j)-Ha(i-j));
        end
    end
    Ha_conversion(i)=tmp_ha;
    Za_conversion(i)=-tmp_za;
end

figure(1),plot(x,Ha,'r',x,Ha_conversion,'b:'),xlabel('X (m)'),ylabel('磁异常(nT.)'),legend('Ha原始异常','Ha转换异常'),title('分量转换异常Za->Ha');
figure(2),plot(x,Za,'r',x,Za_conversion,'b:'),xlabel('X (m)'),ylabel('磁异常(nT.)'),legend('Za原始异常','Za转换异常'),title('分量转换异常 Ha->Za');

