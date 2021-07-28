lower = 5;
upper = 15;
Xlist = linspace(lower,upper,upper-lower+1);
Y1list = linspace(lower,upper,upper-lower+1);
Y2list = linspace(lower,upper,upper-lower+1);
Y3list = linspace(lower,upper,upper-lower+1);
Floorlist = linspace(lower,upper,upper-lower+1);
alpha1 = 0;
for k=lower:upper
    cd C:\Users\cmgri\Documents\Sinclair_Research\2021-Sinclair-Project\Matlab_scripts\graphs
    [G,n1,alpha] = star(k);
    cd C:\Users\cmgri\Documents\Sinclair_Research\2021-Sinclair-Project\Matlab_scripts\
    I = eye(n1);
    J = ones(n1);
    G_comp = J - I - G;
    [Theta, A] = LovThetaQuad(G_comp);
    [Theta1, A1] = LovThetaLin(G_comp);
    fprintf('Independence number difference');
    disp( Theta1-alpha*(alpha-1)/n1-1 );
    disp( Theta1-Theta );
    %disp( 1/((Theta1-alpha)-alpha1) );
    alpha1 = Theta1-alpha;
    disp( k );
end