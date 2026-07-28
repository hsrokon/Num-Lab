clc; clear all; 

x=[1.3:0.01:1.6];
f=@(x) x.^2-2;

plot(x, f(x));
%new file
