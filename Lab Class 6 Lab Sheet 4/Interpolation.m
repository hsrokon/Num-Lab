%%%% Lagrange Interpolation
clear all; close all;clc

x1 = 0; y1 = 2;
x2 = 1; y2 = 1;
x3 = 2; y3 = 0;
x4 = 3; y4 = -1;

p3 = @(x) y1*(x-x2).*(x-x3).*(x-x4)/((x1-x2)*(x1-x3)*(x1-x4))...
+ y2*(x-x1).*(x-x3).*(x-x4)/((x2-x1)*(x2-x3)*(x2-x4))...
+ y3*(x-x1).*(x-x2).*(x-x4)/((x3-x1)*(x3-x2)*(x3-x4))...
+ y4*(x-x1).*(x-x2).*(x-x3)/((x4-x1)*(x4-x2)*(x4-x3));

disp([p3(x1) p3(x2) p3(x3) p3(x4)]); 
plot([x1 x2 x3 x4], [y1 y2 y3 y4],'o'); 
hold on;
grid on

x = x1:0.1:x4+2; plot(x,p3(x));