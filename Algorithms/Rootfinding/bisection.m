function [step_table, estimate_value] = bisection(f, a, b, error_tol)
    % One-dimensional Bisection method implementation.
    % Estimate_value is the estimated value.
    % Requires a < b, assumes f(a)f(b) <0
    % 
    % Arguments:
    % f: a function handle
    % a: left endpoint
    % b: right endpoint
    % error_allowed: error tollerance allowable for termination
    
    % Return: 
    % step_table: an indexed table in the form [a_n, b_n, midpoint]
    % where n is the row number.
    % estimate_value: the final estimate (midpoint)
    %
    % Demo:
    % f = @(x) power(x,3) - 10;
    % error_allowed = 10^(-15);
    % [step_table, estimate_value] = bisection(f,2,3,error_allowed);
    % abs(power(10,1/3) - estimate_value) < error_allowed  % Verify result

    iterates_max = ceil(log2((b - a) / error_tol)); % Note the 1-based indexing
    step_table = zeros(iterates_max, 3);
    step_table(1, 1) = a;
    step_table(1, 2) = b;
    
    for ii=2:iterates_max
        % Copy the previous a,b down a row    
        step_table(ii, 1) = step_table(ii-1, 1);
        step_table(ii, 2) = step_table(ii-1, 2);
        step_table(ii-1, 3) = (step_table(ii, 2) + step_table(ii, 1) ) / 2;

        % Now let's figure out the update rule
        if f(step_table(ii-1, 3)) * f(step_table(ii, 1)) < 0
            step_table(ii, 2) = step_table(ii-1, 3); %Move the right endpoint in
        elseif f(step_table(ii-1, 3)) * f(step_table(ii, 1)) > 0
            step_table(ii, 1) = step_table(ii-1, 3); %Move the right endpoint in            
        end
        
    end
    % Fill out the value
    step_table(iterates_max,3) = ...
        (step_table(iterates_max,2) + step_table(iterates_max,1) ) / 2;
    estimate_value = step_table(iterates_max,3);
    
end