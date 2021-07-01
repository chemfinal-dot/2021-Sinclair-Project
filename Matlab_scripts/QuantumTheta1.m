function [Theta, X1] = QuantumTheta1(G)
%QuantumTheta Computes SDP formulation of Quantum version of the theta
%             function
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
%J = ones(n^2);
I = eye(n);
Delta = choi_id(n);
cvx_begin sdp quiet
    variable X(n^2,n^2) hermitian semidefinite;
    variable t;
    for i = 0:(n-1)
        for j = 0:(n-1)
            for k=1:n
                for l=1:n
                    if (G(k,l) == 0) && (k ~= l)
                        X((i*n)+k,(j*n)+l) == -t*Delta((i*n)+k,(j*n)+l);
                    end
                end
            end
        end
    end
    tr_id(X) == (1-t) * I;
    maximize( t )
cvx_end
Theta = 1/t;
X1 = X;
end

