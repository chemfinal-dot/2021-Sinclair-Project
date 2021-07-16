function [M,m] = prism(n)
% Returns prism graph Y_n = P_2 \square C_n
% Independence number = 2*floor(n/2)
[path1, n1] = path(2);
[cycle2, n2] = cycle(n);
M = cart_product(path1,cycle2);
[numRows, m] = size(M);

end

