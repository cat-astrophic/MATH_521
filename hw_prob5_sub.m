% Sub-function for problem 5

function [X,c] = hw_prob5_sub(X,c,x,y)
    
    % backtrack to a full upper triangular matrix
    
    q = length(X);
    M = zeros(q+1,q+1);
    M(1,1:q) = c; % put coefficients in matrix
    M(q+1,1) = y; % store y in matrix
    
    for j = 2:q % column
        
        for i = 2:j % row

            M(i,q+1-j) = M(i-1,q+1-j) + (X(i+q-j)-X(i-1))*M(i-1,q+1-j+1);
            
        end
        
    end
    
    % compute new entries
    
    for j = 2:q+1 % column
        
        M(q+1-j+1,j) = (M(q+1-j+1+1,j-1)-M(q+1-j+1,j-1))/(x-X(q+1-j+1));
        
    end
    
    % append new value to c
    
    c = M(1,:);
    X = [X x];

end
