function [M,m] = lattice(n1,n2,n3)
% Returns lattice graph (i.e. 3D square lattice graph)
% Independence number = ceil(n^3/2)
[path1,N1] = path(n1);
[path2,N2] = path(n2);
[path3,N3] = path(n3);
M = cart_product(cart_product(path1,path2),path3);
[numRows, m] = size(M);
end

