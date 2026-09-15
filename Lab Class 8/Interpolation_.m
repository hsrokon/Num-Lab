clc; close all; clear all;
%% Divided Differences Method
x1 = -1;
y1 = 0;
x2 = 2;
y2 = 1;
x3 = 3;
y3 = 1;
x4 = 5;
y4 = 2;
f = @(x) 0 + 1/3*(x+1)-1/12*(x+1).*(x-2)+1/24*(x+1).*(x-2).*(x-3);
x_arr = -2:0.01:6;
y_arr = f(x_arr);
plot(x_arr,y_arr);
hold on
x_ =[-1 2 3 5];
y_ =[0 1 1 2];
plot(x_,y_,'o')
hold on

%% Lagrange Method

x = [-1 2 3 5];
y = [0 1 1 2];

n = length(x)-1;
x_given = -1:0.01:4; 
sum = 0;

for i = 1:(n+1)
    product = 1;
    for j =1:n+1
        if j ~= i
            product =product.*(x_given-x(j))./(x(i)-x(j));
        end
    end
    sum = sum + product.*y(i);
end


plot(x_given, sum, 'r')
hold on

plot(x, y, '*')
hold off
