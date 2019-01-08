clc
close all
clear 

N = 5;
dim = N*N;

Lt_new = zeros(dim,dim);

matrix_new = xlsread('1.xlsx');
[new_row,new_col] = size(matrix_new);
for i = 1:1:new_row
    row = matrix_new(i,1);
    col = matrix_new(i,2);
    Lt_new(row,col) = matrix_new(i,3);
end
Lt_new = Lt_new+Lt_new';
Lt_new = 1./Lt_new;
Lt_new(Lt_new==inf) = 0;
Lt_new_next = calDifLaplacian( Lt_new,'standard');
P_t = PressSol(Lt_new_next,dim,N);
Q_t = graphLQ(P_t,Lt_new_next);
[C1_t,C2_t,C_t] = graphLC(P_t,Q_t,N,dim);

