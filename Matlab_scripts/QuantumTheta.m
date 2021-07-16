function [Theta, X1] = QuantumTheta(G)
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
            if (G(i+1,j+1) == 0) && (i ~= j)
                X((1+i*n):((i+1)*n),(1+j*n):((j+1)*n)) == -t*Delta((1+i*n):((i+1)*n),(1+j*n):((j+1)*n));
            end
        end
    end
    tr_id(X) == (1-t) * I;
    maximize( t )
cvx_end

X1 = X;
Theta = 1/t;

end

