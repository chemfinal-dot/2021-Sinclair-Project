%MaxCut using quadprog
% Updated 6/14/2021

%This example considers a graph of a pentagon
Q=[0,1,0,0,1;1,0,1,0,0;0,1,0,1,0;0,0,1,0,1;1,0,0,1,0]; %adjacency matrix
H=Q/2; %as defined for the quadprog function
A=[1 0 0 0 0;-1 0 0 0 0;0 1 0 0 0;0 -1 0 0 0;0 0 1 0 0;0 0 -1 0 0;0 0 0 1 0;0 0 0 -1 0;0 0 0 0 1;0 0 0 0 -1]; %constraint variable
b=[1;1;1;1;1;1;1;1;1;1]; %variable constraints
f=[0;0;0;0;0]; %scalar
l=-ones(5,1); %lower bound
u=-1*l; %upper bound
x= quadprog(H,f,A,b,[],[],l,u) %calls the quadprog function
