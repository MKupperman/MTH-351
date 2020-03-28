function polynomial = Vandermonde_method(Xpts, Ypts)
    % Compute interpolating polynomial through matrix methods.
    % While there are far more advanced methods, this is a minimal example.
 Interpolates the points:
    % (x1, y1), (x2,y2), ..., (xn, yn). 
    % Xpts and Ypts are data vectors of the same length.
    % 
    % Arguments
    % Xpts: a row vector [x1, x2, x3, ... xN]
    % Ypts: a row vector [y1, y2, y3, ... yN]
    % 
    % Return: 
    % polynomial: Symbolic polynomial interpolating the points
    %
    % % Demo
    % x = [1 2 3]
    % y = [1 4 8]
    % interp = Vandermonde_method(x, y)
    
    data_length = length(Xpts);
    VM = ones(data_length);
    for x = 1:data_length  % Loop over each basis function
        for y=1:data_length  % Loop over each data row
            VM(x,y) = Xpts(x)^(y-1);
        end
    end
    values = VM \ Ypts';
    basis = ones(1,data_length, 'sym');
    syms x
    for index=1:data_length
        basis(index) = basis(index) * power(x,index-1);
    end
    P = basis * values;
    polynomial = simplify(P);
end
