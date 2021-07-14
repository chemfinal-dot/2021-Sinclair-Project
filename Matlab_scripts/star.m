function M = star(n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M = zeros(n);
for i=2:n
    M(1,i)=1;
    M(i,1)=1;
end

end