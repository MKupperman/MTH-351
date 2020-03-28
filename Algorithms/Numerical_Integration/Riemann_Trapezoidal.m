function prediction = Riemann_trapezoidal(a,b,n,f)
    % Trapezoidal Riemmann sum of function f on [a,b]
    % with n intervals. 
    % 
    % Arguments:
    % a: left end-point of interval
    % b: right end-point of interval
    % n: number of sub-intervals
    % f: function handle of function to approximate

    xvals = linspace(a,b,n+1);  % Generate n+1 points
    yvals = f(xvals);
    total = 0;
    for ii = 1:n
        total = total + (yvals(ii) + yvals(ii+1))/2*(b-a)/n;
    end
    prediction = total
end