function Za=sphere_all()
% 测点分布范围
dx=5; % X方向测点间距
nx=81; % X方向测点数
xmin=-200; % X方向起点
x=xmin:dx:(xmin+(nx-1)*dx); % X方向范围

u=4*pi*10^(-7);  %磁导率
%i=pi/3;  %有效磁化倾角is
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
Za=zeros(91,nx);
Hax=zeros(91,nx);
for j=0:90
    i=j*pi/180;
    Za0=(u*m1*((2*D1.^2-x.^2-y.^2)*sin(i)-3*D1*x.*cos(i)*cos(a)-3*D1*y.*cos(i)*sin(a)))./(4*pi*(x.^2+y.^2+D1.^2).^(5/2));
    Hax0=(u*m1*((2*x.^2-y.^2-D1.^2)*cos(i)*cos(a)-3*D1*x.*sin(i)+3*x.*y.*cos(i)*sin(a)))./(4*pi*(x.^2+y.^2+D1.^2).^(5/2));
    Za(j+1,:)=Za0;
    Hax(j+1,:)=Hax0;
end
fp=fopen('za.out','w');
for i=1:91
    for j=1:nx
        fprintf(fp,'%g ',Za(i,j));
    end
    fprintf(fp,'\n');    
end
fclose(fp);

fp=fopen('hax.out','w');
for i=1:91
    for j=1:nx
        fprintf(fp,'%g ',Hax(i,j));
    end
    fprintf(fp,'\n');    
end
fclose(fp);

plot(x,Hax0),ylabel('dT/nT'),title('理论球体dT异常主剖面图');








