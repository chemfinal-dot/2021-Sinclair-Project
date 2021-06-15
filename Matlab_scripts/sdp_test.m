n = 7;
%correct_value = theta_cycle(n);
for N=3:13
    
    G = circulant(N,3);
    correct_value = LovTheta1(G);

    Theta = QuantumThetaT(G);
    disp( correct_value );
    disp( Theta );
    
    disp( (Theta - correct_value)/correct_value );
    if ((Theta - correct_value)/correct_value>10^(-4))
        break
    end
end