function [M,m,alpha] = star(n)
% Returns star graph S_n
% Independence number = 1 for n=1, n-1 else
M = zeros(n);
for i=2:n
    M(1,i) = 1;
    M(i,1) = 1;
end
[numRows, m] = size(M);
alpha = n - 1;
if (n == 1)
    alpha = 1;
end
end