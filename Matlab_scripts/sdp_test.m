n = 7;
%correct_value = theta_cycle(n);
for N=5:5
    
    G = cycle(11);
    [correct_value, X2] = LovTheta(G);
    [Theta, X3] = LovTheta2(G);

    %[Theta, X1] = QuantumTheta(G);
    disp( correct_value );
    disp( Theta );
    
    disp( (Theta - correct_value)/correct_value );
    if ((Theta - correct_value)/correct_value>10^(-4))
        break
    end
    
end