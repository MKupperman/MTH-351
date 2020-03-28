function Polynomial = Lagrange_method(xpts, ypts)
    % Construct the interpolating polynomial from data.
    % xpts and ypts are row vectors of the same size.
    % Interpolates the points:
    % (x1, y1), (x2,y2), ..., (xn, yn). 
    % Xpts and Ypts are data vectors of the same length.
    %
    % Arguments:
    % xpts: a row vector [x1, x2,..., xn]
    % ypts: a row vector [y1, y2,..., yn]
    % 
    % Return: Symbolic polynomial
    %
    % % Demo
    % x = [1 2 3]
    % y = [1 4 9]
    % interp = Lagrange_method(x,y) 

    syms t
    % contructing Lagrange polynomials L1, L2,..., Ln

    L = zeros(1,N,'sym');
    for i = 1:N
        L(i) = 1;
        z = xpts;
        z(i) = [];  % Remove the point
        for j = 1:N-1 % Symbolic product
            L(i) = L(i)*(t - z(j))/(x(i) - z(j));
        end
    end
    
    % construct P = y1*L1 + y2*L2 + ... + yn*Ln
    Leg_Polynomial = L*transpose(ypts);
    %Store the polynomial and a label
    Polynomial = simplify(Leg_Polynomial);
end