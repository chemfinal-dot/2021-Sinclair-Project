function [Theta, X1] = LovTheta2(G)
%LovTheta Computes first formulation of Lovasz Theta
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
%J = ones(n);
cvx_precision best
cvx_begin sdp quiet
    variable Y(n,n) semidefinite;
    variable t;
    maximize( t );
    for i=1:n
        for j=1:n
            if ((G(i,j) == 0) && (i ~= j))
                Y(i,j) == -t;
            end
            if(i == j)
                Y(i,i) == 1-t;
            end
        end
    end
cvx_end

X1 = Y;
Theta = 1/t;

end

