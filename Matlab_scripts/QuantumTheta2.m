function [Theta, X1] = QuantumTheta2(G)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[numRows, n] = size(G);


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
            if (G(i+1,j+1) == 1) && (i ~= j)
                %Y = diag(X((1+i*n):((i+1)*n),(1+j*n):((j+1)*n)));
                for l=2:n
                    %Y(1) == Y(l);
                    X(1+i*n,1+j*n) == X(l+i*n, l+j*n);
                end
            end
        end
    end
    tr_id(X) == (1-t) * I;
    maximize( t );
cvx_end


X1 = X;
Theta = 1/t;

end