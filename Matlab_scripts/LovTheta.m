function [Theta, X1] = LovTheta(G)
%LovTheta Computes first formulation of Lovasz Theta
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
cvx_begin sdp quiet
    variable Y(n,n) semidefinite;
    trace(Y) == 1;
    maximize( trace(Y*J) );
    for i=1:n
        for j=1:n
            if(G(i,j)==1)
                Y(i,j) == 0;
            end
        end
    end
cvx_end


Theta = (trace(Y*J));
X1 = Y;
end

