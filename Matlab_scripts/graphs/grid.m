function [M,m] = grid(n,N)
% Returns grid graph (i.e. 2D square lattice)
% Independence number = ceil(n^2/2) for n = N
[path1,N1] = path(n);
[path2,N2] = path(N);
M = cart_product(path1,path2);
[numRows, m] = size(M);
end

