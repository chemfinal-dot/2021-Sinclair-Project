lower = 1;
upper = 1;
n = 4;
Xlist = linspace(lower,upper,upper-lower+1);
Y1list = linspace(lower,upper,upper-lower+1);
Y2list = linspace(lower,upper,upper-lower+1);
Y3list = linspace(lower,upper,upper-lower+1);
Floorlist = linspace(lower,upper,upper-lower+1);

for k=lower:upper
    cd C:\Users\cmgri\Documents\Sinclair_Research\2021-Sinclair-Project\Matlab_scripts\graphs
    [G1,n1] = rand_graph(n,0.5);
    [G2,n2] = rand_graph(n,0.5);
    G = strong_product(G1,G2);
    cd C:\Users\cmgri\Documents\Sinclair_Research\2021-Sinclair-Project\Matlab_scripts\
    I = eye(n^2);
    J = ones(n^2);
    G_comp = J - I - G;
    [Theta, A] = LovThetaLin(G);
    [Theta1, A1] = LovThetaLin(G1);
    [Theta2, A2] = LovThetaLin(G2);
    fprintf('Strong graph property difference');
    disp( Theta-Theta1*Theta2 );
end