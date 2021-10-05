function [Theta, X1] = phi_linVector(G)
%   phi_linVector returns the value from a vector program formulation for phi_lin
%   Input - adjacency matrix for a graph G, size n x n


[numRows, n] = size(G);

% Construct and solve the model
%J = ones(n);
cvx_precision best
cvx_begin sdp quiet
    variable X(n+1,n+1) semidefinite;
    variable t;
    %trace(X) == 1;
    maximize( t );
    for i=1:n
        X(n+1,i) >= t;
        X(i,n+1) >= t;
        for j=1:n
            %X(i,i) == 1;
            if ((G(i,j) == 0) && (i ~= j))
                X(i,j) == 0;
            end
        end
    end
    X(n+1,n+1) == 1;
    trace(X) == n + 1;
cvx_end


Theta = 1/t^2;
X1 = X;
end

