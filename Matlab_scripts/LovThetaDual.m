function [Theta, A] = LovThetaDual(G)
%LovTheta Computes first formulation of Lovasz Theta
%   Input - adjacency matrix for a graph G, size n x n

[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
P = eye(n)+G;
p = n^2+n+2;
D = eye(p); D(p,p)=0; D(p-1,p-1)=0;
cvx_begin sdp quiet
    variable M(p,p) symmetric semidefinite;
    variable t
    variable y(n^2)
    minimize( trace(D*M) );
    for i = 0:(n^2-1)
        q = floor(i/n);
        r = mod(i,n);
        M(n+1+i,n^2+n+1) == -0.5*(M(r+1,q+1)-y(i+1))-P*t;
        if r ~= q
            y(i+1) == 0;
        end
    end
    M(p-1,p-1) == t; 
    M(p,p) == 1-t;
cvx_end


A = M;
Theta = trace(D*M);

%Theta = trace(J*A)/n;
end

