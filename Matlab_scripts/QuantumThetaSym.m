function [phi,X] = QuantumThetaSym(m)
%QUANTUMTHETASYM Summary of this function goes here
%   Detailed explanation goes here

n = m^2;

% Construct and solve the model
P = choi_id(m);
for i = 0:(m-1)
    P((1+i*m):((i+1)*m),(1+i*m):((i+1)*m)) = eye(m)/m;
end

cvx_begin sdp quiet
    variable M(n^2+n+1,n^2+n+1) symmetric semidefinite;
    variable t
    minimize( t );
    M(1:n, n+1:n^2+n+1) == zeros(n, n^2+1);
    M(1+n:n^2+n, 1+n:n^2+n) == eye(n^2);
    for i = 0:(n-1)
        for j = 0:(n-1)
            M(i+1,i+1) == 1/m;
            for l=2:n
                M(1+i*n,1+j*n) - M(l+i*n, l+j*n) == 0;
            end
        end
    end
    for i = 0:(n^2-1)
        q = floor(i/n);
        r = mod(i,n);
        M(n+1+i,n^2+n+1) == M(r+1,q+1);
    end
    M(n^2+n+1,n^2+n+1) - t == (2*trace(P*M(1:n,1:n))-0*trace(P*P));
    
cvx_end


X = M(1:n,1:n);
%Theta = t;

phi = trace(ones(n)*X)/n;

end

