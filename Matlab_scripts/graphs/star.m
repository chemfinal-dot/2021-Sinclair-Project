function [M,m] = star(n)
% Returns star graph S_n
% Independence number = 1 for n=1, n-1 else
M = zeros(n);
for i=2:n
    M(1,i) = 1;
    M(i,1) = 1;
end
[numRows, m] = size(M);
end