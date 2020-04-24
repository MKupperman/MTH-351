function [step_seq, estimate_value] = secant(f, x0, x1, error_allowed)
    % One dimensional rootfinding algorithm using the secant method.
    % Similar to Newton-Raphson with gradient decent, however does not
    % require the objective f to be differentiable everywhere as the
    % gradient is approximated through a finite difference approximation 
    % of the derivative f'.
    %
    % Arguments: 
    % g: a function handle
    % x0: initial guess (a real number)
    % x1: another initial guess (a real number)
    % error_allowed: error tollerance allowable for termination
    
	% Demo:
	% g = @(x) sin(x) + x^2
	% [values, approx] = secant(g, 0.4, 0.1, 1e-7)

	
    step_seq = zeros(2,1);
    step_seq(1) = x0;
    step_seq(2) = x1;
    position = 3;
    do_another_step = true;  % ensure we perform an iteration
	
    while do_another_step
        numerator = step_seq(end-1) * f(step_seq(end)) - step_seq(end)* f(step_seq(end-1));
        denominator = f(step_seq(end)) - f(step_seq(end-1));
        x_new_exp = numerator/denominator;
		
		% Check if the new value is sufficiently close to the previous iterate
    if abs(x_new_exp - step_seq(end)) < error_allowed
            do_another_step = false;
        end
		% Store the newly computed value
        step_seq(position) = x_new_exp;
        position = position + 1;
    end
    estimate_value = step_seq(end);
end