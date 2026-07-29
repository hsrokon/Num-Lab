% Bracketing_Bisection 

f=@(x) x^2-2; % main function
i=0;%iteration

xl = 1.3; % Lower limit of x
xu = 1.6; % Upper limit of x

tol = 0.01; % tolerance

% Root is correct upto 3 decimal place

if(f(xl)*f(xu)>0)
    disp('No root in given bracket');

else
    disp(' xl, f(xl), xu, f(xu), xr, f(xr)'); %just displaying title

    while (abs((xu-xl)/2) > tol) % max possible error should be bigger than tolerance
        xr = (xl + xu)/2; % avg value

        fprintf('%1.3f %1.3f %1.3f %1.3f %1.3f %1.3f \n',...
            xl,f(xl), xu,f(xu),xr,f(xr));

        if(f(xr)==0) break; end

        if(f(xl)*f(xr)>0) % there is no solution between xl & xr, so look for xr and xu
            xl = xr;
        else
            xu = xr;
        end
        i=i+1;
    end % end while

    disp(['Root is ' num2str(xr) ', Iterations taken' num2str(i)]);

    end %end main if
