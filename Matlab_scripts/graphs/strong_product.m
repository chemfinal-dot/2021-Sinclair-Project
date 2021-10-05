function M = strong_product(G1,G2)
%CART_PRODUCT Summary of this function goes here
%   Detailed explanation goes here
[numRows, n1] = size(G1);
[numRows, n2] = size(G2);

M = kron(G1+eye(n1),G2+eye(n2)) - eye(n1*n2);
end

