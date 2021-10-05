function [Theta, X1] = LovTheta(G)
% LovTheta: Computes following formulation of Lovasz Theta, 
% LovTheta = min  tr(A*J)
%            s.t. tr(Y) = 1
%                 Y_ij  = 0 if (i,j) in E
%                    Y >= 0
% Input - adjacency matrix for a graph G = (V,E), size n x n


[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
cvx_precision best
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

