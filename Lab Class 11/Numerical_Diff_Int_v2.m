%% Example 6: Using Simpson's Rule

clear all;close all;clc 
%f=@(x) x.*sqrt(1+x.^4); 
%f=@(x) x.^2+2.*x; 
f=@(x) 0.2+25*x-200*x.^2 +675*x.^3 -900*x.^4 +400*x.^5; 
%f=@(t)1.1* sin(377.*t);

t=0.01:0.001:4;
plot(t,f(t)) % original function

a=0;b=0.8; %try diffferent intervals
int_act= quad(f,a,b) 

% Simpson's Rule 
h2= (b-a)/2;
c=a+h2;
int_simp=(h2/3)*(f(a)+4*f(c)+f(b))
error_simp= 100*abs(int_simp-int_act)/int_act

% Composite Simpson's Rule 
p=3  % no of parabola
h= (b-a)/(2*p); 
% Approach 1 
sum1=0;sum2=0; 
for i=a+h:2*h:b-h
sum1=sum1+4*f(i);
end 
for i=a+2*h:2*h:b-2*h
sum2=sum2+2*f(i);
end 
int_csimp=(h/3)*(f(a)+sum1+sum2+f(b))
error_csimp= 100*abs(int_csimp-int_act)/int_act 


%% Example 8 Using Composite Simpson's Rule

%Find voltage across capacitor at t=3, 6, 8 seconds

clear all;close all;clc 

t=0:1:8;
f=[0 0.5 0.8 1 1.3 0.9 0.4 0.1 0];

a=1;b=4; %try diffferent intervals

% Composite Simpson's Rule 

h=1;  % for this, since points are given, we dont need to calculate parabola
% Approach 1 
sum1=0;sum2=0; 
for i=a+h:2*h:b-h %code works with index, not with time, which is aleays integer
sum1=sum1+4*f(i);
end 
for i=a+2*h:2*h:b-2*h
sum2=sum2+2*f(i);
end 
V_c=(1/0.01)*(h/3)*(f(a)+sum1+sum2+f(b)) % capacitor formula 


%% ODE

% Eulers -- Compare effect of parameter h

clc; clear all; close all;
yo=@(x) x.^3 + 2*x.^2 +1;
f=@(x,y) 3*x.^2+4*x; 
xmin = 0 ;
xmax = 1;
h = 0.2;
 
x = xmin:h:xmax
y = zeros(size(x))
y(1) = 1;
for i =1:length(x)-1
    y(i+1) = y(i) + f(x(i),y(i))*h;
end
y
plot(x,y,'-x', x,yo(x),'r')
hold on

% Runge-Kutta
clc; clear all; %close all
 
f=@(x,y) x.*y+x.^3; 
xmin = 0 ;xmax = 1; h = 0.2; y(1)=1; 
 
x = xmin:h:xmax
for i =1:length(x)-1
    
    k1 = f(x(i),y(i))        
    k2 = f(x(i)+h/2,y(i)+k1*h/2)
    k3 = f(x(i)+h/2,y(i)+k2*h/2)
    k4 = f(x(i+1),y(i)+k3*h)
    
    y(i+1) = y(i) + 1/6*(k1+2*k2+2*k3+k4)*h
end
plot(x,y,'-*')



