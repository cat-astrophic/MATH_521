% Input n is simply the number of nodes for the polynomial interpolation

function c = hw_prob5(n)
    
    for k = 1:n
        
        % get user inputs for x and y
        
        x = input('x = ?\n');
        y = input('y = ?\n');
        
        % initialize X and c
        
        if k == 1
            
            X = x;
            c = y;
            
        else
            
            % run sub function from above
            
            [X,c] = hw_prob5_sub(X,c,x,y);
        
        end
        
    end
    
end

