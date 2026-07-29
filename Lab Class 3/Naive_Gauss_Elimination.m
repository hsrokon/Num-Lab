clc; clear all; close all; format short;
%A = [ 1 2 -1;2 1 -2;-3 1 1]; b = [3 3 -6]'
%A = [3 2 1; 1 2 1 ; 1 2 0 ]; b = [1 2 3]';

%% Roe Echilon
A = [2 1 -1; 6 2 -2; 4 6 -3;]; b = [2 8 5]';
[r,c] = size(A); if (r~=c) disp('Matrix must be square'); end 
Aug = [A b]; Na=c+1;   % No of column of Augmented matrix
disp('..........Augmented Matrix...........'); disp(Aug); 
for i = 1:c-1   % i for column
    if (abs(Aug(i,i))<eps)   
        disp('Zero pivot encountered');
        % i=1; Aug (1,1)
    else
        for j = i+1:r  %j for row
            mult=Aug(j,i)./Aug(i,i);
            Aug(j,:) = Aug(j,:) - Aug(i,:)*mult;
        end
    end
end
disp('    .......After Gauss Elimination.......'); disp(Aug);

%% Back Substitution
x=zeros(r,1); % z=x(3), y=x(2), x=x(1)
x(r)=Aug(r,Na)/Aug(r,c);
 
for i = r-1:-1:1  % row  i = 2
    x(i)= Aug(i,Na);
    for j = i+1:c    %column j= 3, Na=4  
        x(i) = x(i) - Aug(i,j)*x(j);
    end   
    x(i)=x(i)./Aug(i,i);
end
disp('   Solution'); disp(x);

