function [M,m] = cycle(n)
% Returns cycle graph C_n
% Independence number = floor(n/2)
M = zeros(n);
for i=1:n
    M(i, mod(i,n)+1) = 1;
    M(i, mod(i-2,n)+1) = 1;
end
[numRows, m] = size(M);
end

