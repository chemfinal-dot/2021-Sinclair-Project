N = 1;
%correct_value = theta_cycle(n);
lower = 5;
upper = 17;
Xlist = linspace(lower,upper,upper-lower+1);
Y1list = linspace(lower,upper,upper-lower+1);
Y2list = linspace(lower,upper,upper-lower+1);
Floorlist = linspace(lower,upper,upper-lower+1);
for n=lower:upper
    I = eye(n);
    J = ones(n);
    G = rand_graph(n, 0.5);
    G_comp = J - I - G;
    [correct_value, X] = LovThetaQuad(G);
    [Theta, A] = LovThetaLin(G);
    %[Theta_d, A_d] = LovThetaDual(G);
    Y1list(n-lower+1) = correct_value;
    Y2list(n-lower+1) = Theta;
    %Floorlist(n-lower+1) = 2+mod(n,2);
    %[Theta, X1] = QuantumTheta(G);
    fprintf('Lov Theta');
    disp( correct_value );
    fprintf('Quad Theta');
    disp( Theta );
    disp( trace(A*J)/n - trace(X*J)/n)
    %fprintf('Clique Number of Star:');
    %disp( floor(n/2) );
    %fprintf('Chromatic Number of Cycle:');
    %disp( 2 + mod(n,2) );
    disp(n);
    %disp( (Theta - correct_value)/correct_value );
    %if ((Theta-correct_value)/correct_value>10^(-4))
    %    break
    %end
    
end
%plot1=plot(Xlist, Y1list);
%hold on
%plot(Xlist, Y2list)
%plot(Xlist, Floorlist)
%legend('Lov Theta', 'Quad phi', 'chromatic number')
figure;
ax1=subplot(1,2,1);
h1=heatmap(A);
ax2=subplot(1,2,2);
h2=heatmap(X/X(1,1));
