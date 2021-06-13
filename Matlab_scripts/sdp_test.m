n = 3;
%correct_value = theta_cycle(n);
G = rand_graph(n,0.2);
correct_value = LovTheta1(G);

Theta = QuantumTheta(G);
disp( correct_value );
disp( Theta );

%disp( (Theta - correct_value)/correct_value );