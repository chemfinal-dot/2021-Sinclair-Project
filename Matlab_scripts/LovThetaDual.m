function [Theta, A] = LovThetaDual(G)
%LovTheta Computes first formulation of Lovasz Theta
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
I = eye(n);
cvx_begin sdp quiet
    variable Y(n,n);
    minimize( trace(I*Y) );
    for i=1:n
        for j=1:n
            if (G(i,j) == 1)
                Y(i,j) == 0;
            end
        end
    end
    Y - J/n == semidefinite(n) ;
cvx_end


A = Y;
Theta = trace(Y*I);
end

