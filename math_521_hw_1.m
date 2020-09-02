% MATH 521 - Homework Assignment #1

% Problem #1

n = 3.^(1:50);
lhs = (1+(1./n)).^n;
rhs = exp(1)*(1-(1./(2*n)));

% find the best approximation of e from each approach:

lhs_diff = exp(1)-lhs;
rhs_diff = exp(1)-rhs;

lhs_idx = find(min(lhs_diff) == lhs_diff);
rhs_idx = find(min(rhs_diff) == rhs_diff);

% Problem #2

results = [];

for i=1:10000
    
    flag = 0;
    count = 0;
    
    while flag ~= 1

        r = rand(1);
        count = count + 1;

        if r < .01

            flag = 1;

        end

    end
    
    results = [results;count];
    
end

