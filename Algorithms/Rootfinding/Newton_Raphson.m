function [step_seq, estimate_value] = Newton_Raphson(g, x0, error_allowed)
    % One-dimensional newton's method algorithm. Assumes that the
    % function g is a symbolically differentiable function of x.
    % 
    % Arguments:
    % g: a symbolic function of x
    % x0: Starting position
    % error_allowed: error tollerance allowable for termination
    %
    % % Demo:
    % syms g(x)
    % g(x) = x.^3-10;
    % error_allowed = 10^(-5);
    % x0 = 2
    % [step_seq, estimate_value] = Newton_Raphson(g, x0, error_allowed);
    % disp(estimate_value)

    syms h(x)
    h(x) = diff(g,x);
    update_rule = @(val) double(val - g(val)/h(val)); 
    step_seq = x0;
    step_seq(2) = update_rule(x0);
    position = 3;
    while abs(step_seq(end-1) - step_seq(end)) > error_allowed
        step_seq(position) = update_rule(step_seq(position-1));
        position = position + 1;
    end
    
    estimate_value = step_seq(end);
end