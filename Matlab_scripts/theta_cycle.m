function S = theta_cycle(n)
%THETA_CYCLE Summary of this function goes here
%   Detailed explanation goes here
if (mod(n,2) == 0)
    S = n/2;
else
    S = (n*cos(pi/n))/(1+cos(pi/n));
end

end

