%% linear regression/best line
clc; clear all; close all;

A=[1 1; -1 1; 1 1];
b=[2 1 3]';

M = A'*A;
N = A'*b;

%x=imv(M)*N;
x=M\N;
c2=x(1);%first element of x
c1=x(2);%Second element of x

y=@(x) c2*x+c1;

x_arr= -2:0.01:2;
y_arr= y(x_arr);

plot(x_arr,y_arr)
hold on
x_=[1 -1 1];
y_=[2 1 3];
plot(x_,y_,'or') 

%% best parabola

clc; clear all; close all;

%Ax=b Matrix form
A=[1 -1 1; 0 0 1; 1 1 1; 4 2 1];
b=[1 0 0 -2]';

M = A'*A;
N = A'*b;

%x=imv(M)*N;
x=M\N;
c3=x(1)%first element of x
c2=x(2);%Second element of x
c1=x(3);%Third element of x

y=@(x) c3*x.^2+c2*x+c1;

x_arr= -2:0.01:3;
y_arr= y(x_arr);

plot(x_arr,y_arr)
hold on
x_=[-1 0 1 2];
y_=[1 0 0 -2];
plot(x_,y_,'or') 


%% Labsheet problem 8 (b), with the values find best 3rd order polinomial

clc; clear all; close all;

%Ax=b Matrix form
A=[1 1 1 1; 27 9 3 1; 64 16 4 1; 216 36 6 1];
b=[2 2 1 3]';

M = A'*A;
N = A'*b;

%x=imv(M)*N;
x=M\N;
c4=x(1);
c3=x(2);
c2=x(3);
c1=x(4);

y=@(x) c4*x.^3+c3*x.^2+c2*x+c1;

x_arr= -2:0.01:8;
y_arr= y(x_arr);

plot(x_arr,y_arr)
hold on
x_=[1 3 4 6];
y_=[2 2 1 3];
plot(x_,y_,'or') 

% Squired Error
se=(b-A*x)'*(b-A*x)

% Root Mean Squired Error
rmse=sqrt(se/length(b))