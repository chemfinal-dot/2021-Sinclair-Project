function [M,m] = path(n)
% Returns path graph P_n (straight line of vertices)
% Independence number = ceil(n/2)
M = zeros(n);
for i=2:n
    M(i-1,i)=1;
    M(i,i-1)=1;
end
[numRows, m] = size(M);
end

