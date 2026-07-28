clc; clear all;

%incremental search

f=@(x) x^2-2; %original function

h=0.01; % the step for incrementation

x1=1.30; %initial value
x2=x1+h; %incrementation

fprintf('x2 = %1.2f, f(x2) = %1.2f \n', x2, f(x2));

while (f(x1)*f(x2) > 0) %checks if the sign in +ve, +*+=+, -*-=+
    x1=x2;
    x2=x1+h;
    fprintf('x2 = %1.2f, f(x2) = %1.2f \n', x2, f(x2));
end

%when finds the +*-=-, sign negative, exits from loop and gets the mean
%value
fprintf('Final solution is (x1+x2)/2 = %1.2f \n', (x1+x2)/2);
%final answer