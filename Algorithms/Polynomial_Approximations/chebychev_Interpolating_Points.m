function points = chebychev_Interpolating_Points(n,a,b)
    % A utility function to compute the n chebychev points
    % on the interval [a, b].
    % 
    % Arguments:
    % n: integer the number of points to compute
    % a: left endpoint
    % b: right endpoint
    % 
    % Return:
    % points: a row vector of  

    ints = linspace(1,n,n)
    theta_values = (2*ints-1)*pi/2/n;  % broadcasting
    cheb_pts_normalized = cos(theta_values-pi);  % broadcasting 		   
    points = cheb_pts_normalized (b-a) + a

end