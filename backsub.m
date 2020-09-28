% a function imlementing baksubstitution

function c = backsub(L,b)
    
    c = zeros(size(b));
    n = length(b);
    
    for i = 1:n
        
        c(i) = b(i) - L(i,1:i-1)*c(1:i-1);
        c(i) = c(i)/L(i,i);
        
    end    
    
end

