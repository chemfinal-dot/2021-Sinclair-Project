function [M,m,alpha] = grid(n)
% Returns grid graph (i.e. 2D square lattice)
% Independence number = ceil(n^2/2) for n = N
[path1, N1, a1] = path(n);
%[path2,N2] = path(N);
M = cart_product(path1,path1);
[numRows, m] = size(M);
alpha = ceil(n^2/n);
end

