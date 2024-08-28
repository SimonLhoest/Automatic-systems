N=[1.151 0.1774];
D=[1 0.739 0.921 0];
G = tf(N,D) ;
C=1;
pole(G)
%%

%P=6;I=2;D=3;N=42;s=tf('s');%PID=P+I/s+D*s/(1+s/N)
%pid(6,2,3,1/43)
PIDs=tf(pid(6,2,3,1/42));
%bode(PIDs*G)
T=0.010;
PIDz=c2d(PIDs,T,'tustin');

%%
P=6;I=2;D=3;N=42;%s=tf('s');%PID=P+I/s+D*s/(1+s/N)
PIDs=tf(pid(P,I,D,1/N));
sysc=ss(PIDs);
sysd=c2d(sysc,T,'zoh');
%%
s=tf('s');
P=6;I=2;D=3;N=42;
Is=I/s;
Iz=c2d(Is,T,'tustin');
Ds=D*s/(1+s/N);
Dz=c2d(Ds,T,'tustin');
%%
m=0.1;J=m*1^2;l=0.1;g=9.81;c=0.01;
X=[1 2];
x1=X(1); x2=X(2);
%%
Xo=[270*pi/180,0];
uo=-m*g*l*sin(Xo(1));
