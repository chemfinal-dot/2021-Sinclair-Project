function M = circulant(n,k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M = zeros(n);
for i=1:n
    for j=0:(k-1)
        M(i, mod(i+j,n)+1) = 1;
        M(i, mod(i-2-j,n)+1) = 1;
    end
end

end

