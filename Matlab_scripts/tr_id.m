function M = tr_id(X)
%TR_ID Summary of this function goes here
%   Detailed explanation goes here
[numRows, n] = size(X);
if floor(sqrt(n)) ~= sqrt(n)
    ME = MException('MyComponent:notSquare', ...
        'n is not a Square number',str);
    throw(ME)
else
    n = int8(sqrt(n));
end    
M = zeros(n);
for i = 0:(n-1)
    M = M + X((1+i*n):((i+1)*n),(1+i*n):((i+1)*n));
end

end