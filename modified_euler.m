% Exam Problem #4

%f = @(t,y) sin(t*y);
%a = 0;
%b = 10;
%h = 0.1;
%y0 = 1;

function [T,Y] = modified_euler(f,a,b,y0,h)

Y = y0;
T = a;
y = y0;

for t=a:h:b-h
   
    y_squiggle = y + h*f(t,y);
    y = y + (h/2)*(f(t,y)+f(t+h,y_squiggle));
    
    Y = [Y;y];
    T = [T;t+h];

end

end

