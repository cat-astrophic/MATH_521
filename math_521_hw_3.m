% Problem #1

% Define the function and plot it

f = @(x) exp(-x) + x - 3*sin(3*x);
g = @(x) 0*x;

x = -2:.00001:10;
plot(x,f(x))
hold on
plot(x,g(x))

% There are four roots, all in (0,3) -- look at each pair

clf
x = 0:.00001:1;
plot(x,f(x))
hold on
plot(x,g(x))

clf
x = 2:.00001:3;
plot(x,f(x))
hold on
plot(x,g(x))

% State guesses

guesses = [.1,.9,2.45,2.75]; % these are our initial guesses for the roots

% Use Newton's method to find each root

format long
J = @(x) -exp(-x) + 1 - 9*cos(3*x); % derivative
data = [];

for i = 1:4 % for each root
    
    x = guesses(i);
    X = x;
    
    for j = 1:15 % do enough times to converge
        
        x = x-J(x)\f(x);
        X = [X;x];
        
    end
    
    data = horzcat(data,X);
    
end

% Check that convergence is quadratic

errors = abs(data - data(end,:));
quads = errors(1:end-1,:).^2;
comp = errors(2:end,:)./quads;
comp(1:3,:) % truncated b/c of some precision issues; alternatively:
errors2 = errors;
errors2(4:5,1) = [0;0];
comp2 = errors2(2:end,:)./quads

% Problem #2

% defining the function and its Jacobian

f = @(x) [x(1)^2 - x(1)*x(2) - x(2)^2 - 2; x(1)^2 + x(1)*x(2) + 2*x(2)^2 - 8];
J = @(x) [2*x(1) - x(2), -x(1) - 2*x(2); 2*x(1) + x(2), x(1) + 4*x(2)];

% Newton's method applied to the above example

x = [-1;1];
X = x;

for i = 1:50
    
    x = x-J(x)\f(x);
    X = [X x];

end

X'

% Problem #3

f = @(x) x^2 - 5;
x1 = 1.1;
x2 = 1.2;
X1 = x1;
X2 = x2;

for i = 1:50
    
    x1 = X1(end) - f(X1(end))/2.2;
    x2 = X2(end) - f(X2(end))/2.4;
    X1 = [X1 x1];
    X2 = [X2 x2];
    
end

% this converged for X2 but not X1

rats1 = (X1(3:end) - X1(2:end-1)) ./ (X1(2:end-1) - X1(1:end-2));
rats2 = (X2(3:end) - X2(2:end-1)) ./ (X2(2:end-1) - X2(1:end-2));

% Problem #4

f = @(x) 4.*x.^2.*exp(-x) - x;
g = @(x) 0*x;
x = 0:.001:2.5;
plot(x,f(x))
hold on
plot(x,g(x))

% for a fixed point we need abs(f'(x)) < 1

J = @(x) (8*x-4*x^2)*exp(-x) - 1; % the derivative

% the first positive fixed point is unstable because f'' is positive

f1 = @(x) 4.*x.^2.*exp(-x);
g1 = @(x) x;
x = 0:.001:2.5;
plot(x,f1(x))
hold on
plot(x,g1(x))

% use Newton's method to find the larger fixed point

x = 2.1;
X = x;

for i = 1:50
    
    x = x-J(x)\f(x);
    X = [X x];

end

X'

