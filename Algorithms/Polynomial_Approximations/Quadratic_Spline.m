function spline = Quadratic_spline(Xpts,f)
    % Builds a quadratic spline with Xpts points
    % between a and b for function f. 
    % 
    % Arguments
    % Xpts: a row vector [x1, x2, x3, ... xN]
    % 
    % Return: 
    % spline: Symbolic polynomial interpolating Xpts, f(Xpts),
    %  within a piecewise symbolic function. 
    %
    % % Demo
    % x = [1 2 3 4 4.5 7]
    % f = @(x) (x.^-2 + sin(x))
    % spline = Quadratic_Spline(x,f)


    x = Xpts;
    y = f(x);
    n = length(Xpts);
    M = zeros(1,n);
    % We don't need to define M(0) as 0 again

    for ii=2:n  
        % Generate the coefficients
        M(ii) = (2 .* (y(ii) - y(ii-1)))./(x(ii) - x(ii-1)) - M(ii-1);        
    end
    % Build the spline as sum of indicator functions
    syms t  % local variable
    spline = 0;  % function to accumulate approximations
    for ii = 1:n-1  % build each spline locally
        tmp_indicator = piecewise (t<= x(ii), 0, t>x(ii+1), 0, 1); % half-open
        % Build the polynomial
        a_local = ( M(ii) - M(ii+1) ) ./ (2.*(x(ii) - x(ii+1) ) );
        b_local = ( (x(ii) .* M(ii+1)) - (x(ii+1) .* M(ii)))./(x(ii) - x(ii+1));
        
        y_local = a_local .* (t .^2 - x(ii)^2) + b_local .* (t-x(ii)) + y(ii);
        spline = spline +  tmp_indicator * y_local;
    end
end