clc; clear; close all;

f = @(x) 5.*exp(x.^3)+cos(x);
fd= @(x) 15.*exp(x.^3).*x.^2-sin(x); % this fun is not necessary, only used to find error
a =0.1;
b =1;
h =0.01;              % Step size
% f=@(x) x*cos(x);
% fd=@(x) cos(x)+x*sin(x);
% a=pi;
% b=2*pi;
% h=pi/3;
x = a:h:b         % Generate x-axis values
N=length(x);
%% TPF: Two Point Forward
 
for i = 1:N-1
    f_f(i) = ( f(x(i)+h) - f(x(i)) )/h;
    e_f(i)= abs(f_f(i)-fd(x(i))); %error finding   
end
subplot(3,1,1); plot(x,fd(x), x(1:end-1),f_f);
 
TPF= [f_f' e_f']
 
%% TPB: Two Point Backward
 
for i = 2:N
    f_b(i) = ( f(x(i)) - f(x(i)-h) )/h;
    e_b(i)= abs(f_b(i)-fd(x(i)));
end
subplot(3,1,2); plot(x,fd(x), x(2:end),f_b(2:end)); 
TPB= [f_b' e_b']
 
%% TPC : Three Point Central
for i = 2:N-1
    f_c(i) = ( f(x(i)+h) - f(x(i)-h) )/(2*h);
    e_c(i)= abs(f_c(i)-fd(x(i)));
end
subplot(3,1,3); plot(x,fd(x), x(2:end-1),f_c(2:end)); 
TPC= [f_c' e_c']


%% For any Given data

% t=0:.1:1; % place any data here as vector t=[....]
% y=t.^3- 2*t.^2 -3*t + 1; % place any data here as vector y=[....]

t=0.1:0.1:0.7;
y=[2.2 2.4 2.7 3 3.9 4 5];

fd_TPF= ( y(2:end)-y(1:end-1) ) ./ ( t(2:end)-t(1:end-1) );
plot(t(1:end-1),fd_TPF); hold on;
 
fd_TPB= ( y(2:end)-y(1:end-1) ) ./ ( t(2:end)-t(1:end-1) );
plot(t(2:end),fd_TPB,'r-'); hold on;

fd_TPC= ( y(3:end)-y(1:end-2) ) ./ ( t(3:end)-t(1:end-2) );
plot(t(2:end-1),fd_TPC,'g-');

legend('TPF', 'TPB', 'TPC');



%% Integration with Composite Trapezoid Rule

clear all;close all;clc 
%f=@(x) x.*sqrt(1+x.^4); 
%f=@(x) x.^2+2.*x; 
f=@(x) 0.2+25*x-200*x.^2 +675*x.^3 -900*x.^4 +400*x.^5; 
%f=@(t)1.1* sin(377.*t);
a=0;b=0.8; %try diffferent intervals
% function
t = a:(b-a)/20: b;
plot(t,f(t)) 
 
% actual integration
int_act= quad(f,a,b) % build in integration fun
 
% Trapezoid Rule 
h1=b-a;
int_trap= 0.5*h1*(f(a)+f(b))
error_trap= 100*abs(int_trap-int_act)/int_act 
 
% Composite Trapezoid Rule 
n=10     % no of trapezoid | to reduce error increase the number of n
h= (b-a)/n;
sum=0;
for i = (a+h):h:b-h
    sum=sum+2*f(i);
end

int_ctrap=(h/2)*(f(a)+sum+f(b))% our actual function
error_ctrap=100*abs(int_ctrap-int_act)/int_act