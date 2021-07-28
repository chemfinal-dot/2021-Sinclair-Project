function [M, m, alpha] = complete(n)
% Returns complete graph
% Independence number = 1
M = ones(n)-eye(n);
[numRows, m] = size(M);
alpha = 1;
end

