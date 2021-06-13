function s = choi_id(n)
%CHOI Computes Choi matrix for the identity
%   Input: n - size of n x n identity matrix
s = zeros(n^2, n^2);
for i = 1:n
    for j = 1:n
        E = zeros(n);
        E(i,j)= 1;
        s = s + kron(E,E);
    end
end


end

