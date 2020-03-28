function prediction = Riemann_midpoint(a,b,n,f)
    % Midpoint Riemmann sum of function f on [a,b]
    % with n intervals. 
    % 
    % Arguments:
    % a: left end-point of interval
    % b: right end-point of interval
    % n: number of sub-intervals
    % f: function handle of function to approximate

    xvals = linspace(a,b,n+1);  % Generate n+1 points
    total = 0;
    for ii = 1:n
        total = total + f((xvals(ii) + xvals(ii+1))/2)*(b-a)/n;
    end
    prediction = total
end
