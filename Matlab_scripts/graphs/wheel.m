function [M,m,alpha] = wheel(n)
% Returns wheel graph
% Independence number = floor((n-1)/2)
M = zeros(n);
for i=1:(n-1)
    M(n,i)=1;
    M(i,n)=1;
    M(i, mod(i,n-1)+1) = 1;
    M(i, mod(i-2,n-1)+1) = 1;
end
[numRows, m] = size(M);
alpha = floor((n-1)/2);
end