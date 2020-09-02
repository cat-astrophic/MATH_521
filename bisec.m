% define function f
%f = @(x) x.^3-3*x-1;
%x = -2:0.1:2;
%plot(x,f(x)), grid on
%X = bisec(f,0,1,.001)

function X = bisec(f,a,b,tol)
    
    % a,b are starting values
    % tol is the desired bound for the error
    
    e = (b-a)/2;
    x = [a b];
    y = f([a b]);
    X = x;
    
    if y(1)*y(2) > 0
        
        display('need opposite signs')
        return
        
    end
    
    while e >= tol
        
        y = f([a b]);
        c = (x(1) + x(2))/2;
        yc = f(c);
        
        if yc*y(1) > 0
            
            x = [c x(2)];
            y = [yc y(2)];
            
        else
            
            x = [x(1) c];
            y = [y(1) yc];
            
        end
        
        X = [X;x];
        e = e/2;
    
    end

end