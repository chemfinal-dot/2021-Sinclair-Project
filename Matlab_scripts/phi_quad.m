function [Theta, A] = phi_quad(G)
%LovTheta Computes first formulation of Lovasz Theta
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
P = eye(n)+G;
cvx_precision best
cvx_begin sdp quiet
    variable M(n^2+n+1,n^2+n+1) symmetric semidefinite;
    variable t
    minimize( t );
    M(1:n, n+1:n^2+n+1) == zeros(n, n^2+1);
    M(1+n:n^2+n, 1+n:n^2+n) == eye(n^2);
    %trace(M(1:n,1:n)*eye(n)) == 1;
    for i = 1:n
        for j = 1:n
            M(i,i) == 1;
            if (G(i,j) == 0) && (i ~= j)
                M(i,j) == 0;
            end
        end
    end
    for i = 0:(n^2-1)
        q = floor(i/n);
        r = mod(i,n);
        M(n+1+i,n^2+n+1) == M(r+1,q+1);
    end
    M(n^2+n+1,n^2+n+1) - t == (2*trace(P*M(1:n,1:n))-1*trace(P*P));
    
cvx_end


A = M(1:n,1:n);
%Theta = t;

Theta = trace(J*A)/n;
end

