% Change format to long

format long

% Defining a vector function

f = @(x) [x(1)^2 - x(1)*x(2) - x(2)^2 - 1; x(1)^2 + x(1)*x(2) + 2*x(2)^2 - 5];

% Defining the Jacobian of the function

J = @(x) [2*x(1) - x(2), -x(1) - 2*x(2); 2*x(1) + x(2), x(1) + 4*x(2)];

% Newton's method applied to the above example

x = [-1;1];
X = x;

for i = 1:50
    
    x = x-J(x)\f(x);
    X = [X x];

end

X'

