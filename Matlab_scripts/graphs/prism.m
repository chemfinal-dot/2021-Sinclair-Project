function [M,m,alpha] = prism(n)
% Returns prism graph Y_n = P_2 \square C_n
% Independence number = 2*floor(n/2)
[path1, n1, a1] = path(2);
[cycle2, n2, a2] = cycle(n);
M = cart_product(path1,cycle2);
[numRows, m] = size(M);
alpha = 2*floor(n/2);
end

