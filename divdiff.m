% this function does divided differences for newton interpolation
% x is the set of nodes
% y = f(x)
% the top row of D provides the coefficients for the polynomial

function d = divdiff(x,y)
    
    n = length(x);
    D = zeros(n,n);
    D(:,1) = y;
    
    for j = 2:n
        
        for i = 1:n-j+1
            
            D(i,j) = (D(i+1,j-1)-D(i,j-1))/(x(i+j-1)-x(i));
            
        end
        
    end
    
    d = D(1,:);
    
end

