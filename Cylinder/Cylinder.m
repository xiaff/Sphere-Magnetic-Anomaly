clc;
clear;

% 测点分布范围
dx=5; % X方向测点间距
dy=5; % Y方向测点间距
nx=81; % X方向测点数
ny=81; % Y方向测点数
xmin=-200; % X方向起点
ymin=-200; % Y方向起点
x=xmin:dx:(xmin+(nx-1)*dx); % X方向范围
y=ymin:dy:(ymin+(ny-1)*dy); % Y方向范围
[X,Y]=meshgrid(x,y); % 转化为排列

u=4*pi*10^(-7);  %磁导率
i=pi/3;  %有效磁化倾角is
A=0; %剖面磁方位角
T=50000;%地磁场T=50000nT

% 圆柱体体参数
R1=10; % 球体半径 m
D1=30; % 球体埋深 m
S1=pi*R1^2;
v1=4*pi*R1^3;
k=0.2; %磁化率
M1=k*T/u;  %磁化强度 A/m
m1=M1*v1;   %磁矩

% 圆柱体 理论磁异常
Za=(u*m1*((D1.^2-(X-50).^2)*sin(i)-2*D1*(X-50).*cos(i)))./(2*pi*((X-50).^2+D1.^2).^2);
Ha=-u*m1*((D1.^2-(X-50).^2)*cos(i)+2*D1*(X-50).*sin(i))./(2*pi*((X-50).^2+D1.^2).^2);
deltT=u*m1*sin(i)*((D1^2-X.^2)*cos(2*i-pi/2)-2*D1*X.*cos(2*i-pi/2))./(2*pi*(X.^2+D1^2).^2*sin(i));

figure(1),pcolor(X,Y,Za),shading interp,xlabel('x(m)'),ylabel('y(m)'),title('理论球体 Za异常');
figure(2),pcolor(X,Y,Ha),shading interp,xlabel('x(m)'),ylabel('y(m)'),title('理论球体 Ha常');
figure(3),pcolor(X,Y,deltT),shading interp,xlabel('x(m)'),ylabel('y(m)'),title('理论球体 delta T常');


%输出grd文件
nx=max(size(x));
ny=max(size(y));
xmin=x(1);
xmax=x(nx);
ymin=y(1);
ymax=y(ny);
zmin=min(min(Za));
zmax=max(max(Za));
%Za
fp=fopen('Za.grd','w');
fprintf(fp,'DSAA\n');
fprintf(fp,'%d\t%d\n',nx,ny);
fprintf(fp,'%g\t%g\n',xmin,xmax);
fprintf(fp,'%g\t%g\n',ymin,ymax);
fprintf(fp,'%g\t%g\n',zmin,zmax);
for i=1:ny
    for j=1:nx
        fprintf(fp,'%g\t',Za(i,j));
        if mod(j,10)==0
            fprintf(fp,'\n');
        end
    end
    fprintf(fp,'\n');
end
fclose(fp);

zmin=min(Ha);
zmax=max(Ha);
fp=fopen('Ha.grd','w');
fprintf(fp,'DSAA\n');
fprintf(fp,'%d\t%d\n',nx,ny);
fprintf(fp,'%g\t%g\n',xmin,xmax);
fprintf(fp,'%g\t%g\n',ymin,ymax);
fprintf(fp,'%g\t%g\n',zmin,zmax);
for i=1:ny
    for j=1:nx
        fprintf(fp,'%g\t',Ha(i,j));
        if mod(j,10)==0
            fprintf(fp,'\n');
        end
    end
    fprintf(fp,'\n');
end
fclose(fp);


%deltT
zmin=min(deltT);
zmax=max(deltT);
fp=fopen('deltT.grd','w');
fprintf(fp,'DSAA\n');
fprintf(fp,'%d\t%d\n',nx,ny);
fprintf(fp,'%g\t%g\n',xmin,xmax);
fprintf(fp,'%g\t%g\n',ymin,ymax);
fprintf(fp,'%g\t%g\n',zmin,zmax);
for i=1:ny
    for j=1:nx
        fprintf(fp,'%g\t',deltT(i,j));
        if mod(j,10)==0
            fprintf(fp,'\n');
        end
    end
    fprintf(fp,'\n');
end
fclose(fp);