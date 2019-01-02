clc
close all
clear 

%% Parameter Configuration
N = 5;
dim = N*N;
C1_obj = 0.85;   %C1_obj is the objection of out1 concertration
C2_obj = 0.15;  %C2_obj is the objection of out2 concertration
MaxIte = 5000000;

SolTh = 1e-5;   %the threshold of iteration
epsilon = 0.01;
lambda1 = 5;
lambda2 = 5;
mu = 1;
gamma = 0.08;
%% Laplacian Matrix
e = ones(dim,1);
e1 = zeros(dim,1);
A = spdiags ([e,e,e1,e,e],[-N,-1,0,1,N],dim,dim);
G = full(A);
for i = 2:1:dim-1
    if rem(i,N) == 0
        G(i,i+1) = 0;
        G(i+1,i) = 0;
    end
end
G = calDifLaplacian( G,'standard');   %G is a laplacian matrix

%% Initialize
LG_inil = G;
P_inil = PressSol(LG_inil,dim,N);
%P is the node pressure in the grid
%P is a matrix, P_col is a colum vector which is a coordinate transformation
Q_inil = graphLQ(P_inil,LG_inil);
%Q is matrix whihc is consist of Q_row vector and Q_col vector that are transformed
[C1_inil,C2_inil,C_inil] = graphLC_pro(P_inil,LG_inil,Q_inil,N);
%C1_inil and C2_inil are the two output concentration

% lambda1 = (C1_inil-C1_obj-epsilon)^2;
% lambda2 = (C2_inil-C2_obj-epsilon)^2;
%% main function
st = -1;
for i = 1:1:MaxIte
    [st,Lt,C1_t,C2_t,Pt,Qt] = main_fun(C_inil,LG_inil,C1_obj,C2_obj,C1_inil,C2_inil,lambda1,lambda2,gamma,mu,SolTh,epsilon,dim,N);
    if st == 1
        break;
    end
end