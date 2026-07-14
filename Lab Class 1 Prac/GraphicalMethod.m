clc; clear all; 
x=[1.3:0.1:1.6];
f=@(x) x.^2-2;

plot(x,f(x),[1.3 1.6], [0 0]);
grid on;