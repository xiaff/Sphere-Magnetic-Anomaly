function Za=sphere_deeps()
% ���ֲ���Χ
dx=5; % X��������
nx=81; % X��������
xmin=-200; % X�������
x=xmin:dx:(xmin+(nx-1)*dx); % X����Χ

u=4*pi*10^(-7);  %�ŵ���
i=pi/2;  %��Ч�Ż����is
a=0; %����ŷ�λ��
T=50000;%�شų�T=50000nT

% �������
R1=10; % ����뾶 m
%D1=30; % �������� m
v1=4*pi*R1^3;
k=0.2; %�Ż���
M1=k*T/u;  %�Ż�ǿ�� A/m
m1=M1*v1;   %�ž�

% ���� ���۴��쳣������
%(x-0),(y-0)
y=0;
Za=zeros(46,nx);
Hax=zeros(46,nx);

fp=fopen('za_all.out','w');
for ii=0:90
    i=ii*pi/180;
    for j=0:45
        D1=10+j*2;
        Za0=(u*m1*((2*D1.^2-x.^2-y.^2)*sin(i)-3*D1*x.*cos(i)*cos(a)-3*D1*y.*cos(i)*sin(a)))./(4*pi*(x.^2+y.^2+D1.^2).^(5/2));
        for k=1:nx
            fprintf(fp,'%g ',Za0(k));
        end
        fprintf(fp,'\n');
%         Za(j+1,:)=Za0;
%         Hax(j+1,:)=Hax0;
    end
end
fclose(fp);

fp=fopen('hax_all.out','w');
for ii=0:90
    i=ii*pi/180;
    for j=0:45
        D1=10+j*2;
        Hax0=(u*m1*((2*x.^2-y.^2-D1.^2)*cos(i)*cos(a)-3*D1*x.*sin(i)+3*x.*y.*cos(i)*sin(a)))./(4*pi*(x.^2+y.^2+D1.^2).^(5/2));
        for k=1:nx
            fprintf(fp,'%g ',Hax0(k));
        end
        fprintf(fp,'\n');
    end
end
fclose(fp);

% fp=fopen('hax_deep.out','w');
% for i=1:46
%     for j=1:nx
%         fprintf(fp,'%g ',Hax(i,j));
%     end
%     fprintf(fp,'\n');
% end
% fclose(fp);

plot(x,Hax0),ylabel('dT/nT'),title('��������dT�쳣������ͼ');







