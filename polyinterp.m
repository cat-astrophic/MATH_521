function s = polyinterp(t,x,y)
    
    n = length(x);
    d = divdiff(x,y);
    c = x(1:n);
    s = newtpoly(t,d,c);   
    
end

