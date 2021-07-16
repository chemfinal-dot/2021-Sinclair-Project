lower = 3;
upper = 3;

Xlist = linspace(lower,upper,upper-lower+1);
Y1list = linspace(lower,upper,upper-lower+1);
Y2list = linspace(lower,upper,upper-lower+1);
Y3list = linspace(lower,upper,upper-lower+1);
Floorlist = linspace(lower,upper,upper-lower+1);

for k=lower:upper
    cd C:\Users\cmgri\Documents\Sinclair_Research\2021-Sinclair-Project\Matlab_scripts\graphs
    [G,n] = grid(k,k);
    cd C:\Users\cmgri\Documents\Sinclair_Research\2021-Sinclair-Project\Matlab_scripts\
    I = eye(n);
    J = ones(n);
    G_comp = J - I - G;
    [correct_value, X] = LovTheta2(G);
    [Theta, A] = LovThetaQuad(G_comp);
    [Theta_Lin, A_Lin] = LovThetaLin(G_comp);
    Y1list(n-lower+1) = correct_value;
    Y2list(n-lower+1) = Theta;
    Y3list(n-lower+1) = Theta_Lin;
    %Floorlist(n-lower+1) = 2+mod(n,2);
    %[Theta, X1] = QuantumTheta(G);
    fprintf('Lov Theta');
    disp( correct_value );
    fprintf('Quad phi');
    disp( Theta );
    fprintf('Lin phi');
    disp( Theta_Lin );
    disp( correct_value - Theta_Lin );
    %fprintf('Clique Number of Star:');
    %disp( floor(n/2) );
    %fprintf('Chromatic Number of Cycle:');
    %disp( 2 + mod(n,2) );
    %disp( (Theta - correct_value)/correct_value );
    disp(K);
    if ((Theta_Lin-correct_value)>0)
        break
    end
    
end
%plot1=plot(Xlist, Y1list);
%hold on
%plot(Xlist, Y2list)
%plot(Xlist, Y3list)
%plot(Xlist, Floorlist)
%legend('Lov Theta', 'Quad phi', 'Lin phi')
%figure;
%ax1=subplot(1,2,1);
%h1=heatmap(X);
%ax2=subplot(1,2,2);
%h2=heatmap(A_Lin);