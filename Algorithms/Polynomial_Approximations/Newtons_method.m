function polynomial = newtons_method(Xpts, Ypts)
    % Finds the interpolating polynomial of Xpts with
    % Newton's method. Interpolates the points:
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
    % y = [1 4 9]
    % interp = Lagrange_method(x,y)
    
    data_length = length(Xpts);
    % Find div-dif coefficients with dynamic programming
    datalength = length(Xpts);
    coef_array = zeros(datalength);
    coef_array(:,1) = Ypts';  % Write the data values to the first column
    for col = 2:datalength
        for row = 1 : (datalength - col + 1)
            %and now our magic step
            coef_array(row, col) = (coef_array(row+1, col-1) - coef_array(row, col - 1) )/(Xpts(row + col -1) - Xpts(row));
        end
    end
    % Obtain the coefficients from the table 
    coef = coef_array(1,1:end); 

    % Find the basis polynomials
    basis = ones(1,data_length, 'sym');  % To store our basis polynomials
    syms t  % Our symbolic variable
    for basis_index = 2:length(basis)  % Loop over each basis
        for x_index = 1:basis_index-1  % Loop over the first basis_index data points we want
            basis(basis_index) = basis(basis_index) * (t - Xpts(x_index));
        end
    end
    
    % Construct the interpolating polynomial
    P = basis*coef';
    polynomial = simplify(P);
end
