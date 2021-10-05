function M = tr_id(X)
%TR_ID Summary of this function goes here
%   Detailed explanation goes here
[numRows, n] = size(X);
if (mod(sqrt(n), 1) ~= 0)
    ME = MException('MyComponent:notSquare', ...
        'n is not a Square number',str);
    throw(ME)
end    
N = int32(sqrt(n));
M = zeros(N);
for i = 0:(N-1)
    M = M + X((1+i*N):((i+1)*N),(1+i*N):((i+1)*N));
end

end