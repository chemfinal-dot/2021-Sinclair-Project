function [M,m,alpha] = pan(n)
% Returns pan graph
% Independence number = 1 + floor(n/2)
M = zeros(n+1);
M(n+1,n)=1;
M(n,n+1)=1;
for i=1:n
    M(i, mod(i,n)+1) = 1;
    M(i, mod(i-2,n)+1) = 1;
end
[numRows, m] = size(M);
alpha = 1 + floor(n/2);
end