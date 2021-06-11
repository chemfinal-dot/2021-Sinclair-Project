function M = cycle(n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M = zeros(n);
for i=1:n
    M(i, mod(i,n)+1) = 1;
    M(i, mod(i-2,n)+1) = 1;
end

end

