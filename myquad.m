function [w,m,C]=myquad(t,a,b)
%function [w,m,C]=myquad(t,a,b)
%t are the desired nodes on interval [a,b] where we are integrating
%over interval [a,b]. t is a row vector
%w is weights, m is degree of exactness C is coeff in leading term
%Cf(m+1)(0)h^(m+2) of the error in scaled formula using weights hw and
%integrating over [ah,bh]
%*************************************
%first formulate array A
n=length(t); %the degree is n-1 we are using n nodes
A=ones(size(t)); for k=1:n-1, A=[A;t.^k];end %k is the power
B=zeros(n,1);B(1)=(b-a); %initializing right hand side B, with B(1)
%equal to the integral of x^0=1 over the interval [a,b]
for j=2:n,B(j)=(b^j-a^j)/j;end % integrating x^k over [a,b], j=k+1
w=A\B; %the weights
%formula is exact up to degree n-1, now test higher degrees
%now for exactness
m=n; %first degree for which formula may not be exact - so test it
e=(b^(m+1)-a^(m+1))/(m+1)-(t.^m)*w; %the error in the formula for x^m
while abs(e)<1.e-10 %while formula is exact (to matlab precision)
    %note that (t.^m)*w is our formula being applied to x.^m at nodes
    %and (b^(m+1)-a^(m+1))/(m+1) is the integral of x.^m from a to b
    m=m+1; %go to the next degree
    e=(b^(m+1)-a^(m+1))/(m+1)-(t.^m)*w; %calculate error for new m
end
%note that on leaving the loop, e is the first nonzero error for x^m
%at current value of m, formula is not exact for x.^m
m=m-1; % now m represents highest degree for which formula is exact
C=e/factorial(m+1); %recall that e is the nonzero error associated with
%x^(m+1) as computed in the loop
end