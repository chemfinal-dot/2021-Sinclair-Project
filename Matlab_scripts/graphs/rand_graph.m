function M = rand_graph(n,prob)
%RAND_GRAPH Outputs an adjacency matrix of size nxn
%   prob is a number from 0 to 1 that determines the probability of
%   assigning an edge
M=zeros(n);
for i = 1:(n-1)
    for j = (i+1):n
        if(rand < prob)
            M(i,j) = 1;
            M(j,i) = 1;
        end
    end
end

end

