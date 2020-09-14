% LU matrix decomposition

function [L,U] = LU(A)
    
    [m,n] = size(A);
    L = eye(m);
    U = A;
    
    for j = 1:m
       
        M = U(j+1:m,j)/U(j,j);
        E = eye(m);
        E(j+1:m,j) = -M;
        U = E*U;
        L(j+1:m,j) = M;
        
    end
    
end

