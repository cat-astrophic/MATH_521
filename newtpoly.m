% newton interpolation of polynomials
% a is coefficients; c is centers

function y = newtpoly(x,a,c)
    
    n = length(a);
    y = a(n)*ones(size(x));
    
    for k = n-1:-1:1
        
       y = a(k) + (x-c(k)).*y;
        
    end
    
end

