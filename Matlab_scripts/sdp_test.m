n = 5;
correct_value = (n*cos(pi/n))/(1+cos(pi/n));
G = cycle(n);
Theta = LovTheta(G);
disp( Theta );