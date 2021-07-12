n = 8;
%correct_value = theta_cycle(n);
for N=5:5
    J = ones(n);
    G = cycle(n);
    [correct_value, X] = LovTheta2(G);
    [Theta, A] = LovThetaTest(G);
    %[Theta_d, A_d] = LovThetaDual(G);

    %[Theta, X1] = QuantumTheta(G);
    fprintf('Lov Theta');
    disp( correct_value );
    fprintf('Quad Theta');
    disp( Theta );
    
    disp( (Theta - correct_value)/correct_value );
    if ((Theta - correct_value)/correct_value>10^(-4))
        break
    end
    
end