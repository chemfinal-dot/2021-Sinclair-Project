function [M,m,alpha] = hypercube(n)
% Returns hypercube graph
% Independence number = 2^(n-1)
[M1 ,n1, a1] = path(2);
M = M1;
for i=2:n
    M = cart_product(M,M1);
end
[numRows, m] = size(M);
alpha = 2^(n-1);
end

