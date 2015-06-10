function Za=sphere_all()
% ���ֲ���Χ
dx=5; % X��������
nx=81; % X��������
xmin=-200; % X�������
x=xmin:dx:(xmin+(nx-1)*dx); % X����Χ

u=4*pi*10^(-7);  %�ŵ���
%i=pi/3;  %��Ч�Ż����is
a=0; %����ŷ�λ��
T=50000;%�شų�T=50000nT

% �������
R1=10; % ����뾶 m
D1=30; % �������� m
v1=4*pi*R1^3;
k=0.2; %�Ż���
M1=k*T/u;  %�Ż�ǿ�� A/m
m1=M1*v1;   %�ž�

% ���� ���۴��쳣������
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

plot(x,Hax0),ylabel('dT/nT'),title('��������dT�쳣������ͼ');







