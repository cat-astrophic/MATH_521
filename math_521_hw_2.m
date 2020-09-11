% Problem #3

format long

X = [];
diffs = [];
rats = [];
ests = [];

for i = 1:10
    
    x = 10^(-i);
    diff = tan(x)-x;
    est = (x^3)/3;
    ests = [ests;est];
    rat = diff/(x^3);
    diffs = [diffs; diff];
    rats = [rats; rat];
    X = [X;x];
    
end

% Compute error ratios

err_rats = diffs(2:end) ./ diffs(1:end-1); % ratio = 10^-3

% Display the differences and ratios

res = horzcat(X,diffs,rats)

% Computing the value for n 

n = (-16-log10(1/3)+3)/(-3);

% Based on this we need n > 4, and the following shows that for n=5 is the
% last time we have significant digits

diffs(1:ceil(n)+1)

% View the differences between actual differences and estiamted differences

acc = diffs - ests

% Problem #4

% Initial verification for result over [0,pi/4]

errs = [];

for x = 0:pi/400:pi/4
    
    err = cos(x) - 1 + (x^2)/2 - (x^4)/factorial(4) + (x^6)/factorial(6);
    errs = [errs;err];    
    
end

errs

% Solving for k

cos_errs = [];
val = 1;

for n = 1:10
    
    val = val + (((-1)^n)*((pi/4)^(2*n)))/factorial(2*n);
    err = cos(pi/4) - val;
    cos_errs = [cos_errs;err];
    
end

cos_errs

sin_errs = [];
val = 0;

for n = 1:10
    
    val = val + ((-1)^(n-1)*((pi/4)^(2*n-1)))/factorial(2*n-1);
    err = sin(pi/4) - val;
    sin_errs = [sin_errs;err];
    
end

sin_errs


