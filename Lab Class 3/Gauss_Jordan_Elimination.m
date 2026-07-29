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

%% Reduced Roe Echilon
disp('    .......After LT Elimination.......'); disp(Aug);
for j = c:-1:2   % i for column to operate
    for i = (j-1):-1:1  %j for row to operate
        mult=Aug(i,j)./Aug(j,j);
        Aug(i,:) = Aug(i,:) - Aug(j,:)*mult;
        disp(Aug);
    end
end
disp('    .......After UT Elimination.......'); disp(Aug);

%% Simplified Back Substitution
 for i=1:r
    x(i)=Aug(i,Na)/Aug(i,i);
end
disp('    .......Solution.......'); disp(x);
