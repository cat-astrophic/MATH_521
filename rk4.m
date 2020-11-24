
function [T,Y]=rk4(f,a,b,y0,h)

T=a:h:b;
y=y0;
Y=[y];

for t=T(1:end-1)
    
    dy1=f(t,y)*h; %euler estimate of y(t+h)-y(t)
    dy2=f(t+h/2,y+dy1/2)*h;
    dy3=f(t+h/2,y+dy2/2)*h;
    dy4=f(t+h,y+dy3)*h;
    y=y+(dy1+2*dy2+2*dy3+dy4)/6;
    Y=[Y y]; %augment with a new column
    
end

