clc; clear all; 

x=[1.3:0.01:1.6];
f=@(x) x.^2-2;

plot(x, f(x), [1.3 1.6], [0 0]); 

% first 2 means x vs f(x)
% second 2 means [1.3 1.6] vs [0 0]