function [M,m,alpha] = centipede(n)
% Returns wheel graph
% Independence number = floor((n-1)/2)
M = zeros(2*n);
for i=1:(n)
    M(i,n+i)=1;
    M(n+i,i)=1;
end
if i>2
    
end
[numRows, m] = size(M);
alpha = n;
end