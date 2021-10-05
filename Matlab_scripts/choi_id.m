function s = choi_id(n)
%choi_id Computes Choi matrix for the identity
%   Ch(\Phi) = \sum_{i,j} E_{ij} \otimes \Phi(E_{ij}), with \Phi = id
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

