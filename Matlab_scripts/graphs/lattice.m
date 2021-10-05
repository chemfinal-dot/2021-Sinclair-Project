function [M,m,alpha] = lattice(n)
% Returns lattice graph (i.e. 3D square lattice graph)
% Independence number = ceil(n^3/2)
[path1,N1,a1] = path(n);
M = cart_product(cart_product(path1,path1),path1);
[numRows, m] = size(M);
alpha = ceil(n^3/2);
end

