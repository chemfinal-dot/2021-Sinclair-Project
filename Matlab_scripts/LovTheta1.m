function Theta = LovTheta1(G)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[numRows, n] = size(G);

% Construct and solve the model
J = ones(n);
cvx_begin sdp
    variable Y(n,n) symmetric;
    Y == semidefinite(n);
    trace(Y) == 1;
    maximize( trace(Y*J) )
    for i=1:n
        for j=1:n
            if(G(i,j)==1)
                Y(i,j) == 0;
            end
        end
    end
cvx_end


Theta = trace(Y*J);

end

