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
[C1_t,C2_t,C_t] = graphLC(P_t,Lt_new_next,Q_t,N,dim);
C_up = zeros(40,3);
count = 1;
flag = zeros(dim,dim);
for j = 1:1:dim-1
    if Lt_new_next(j,j+1) ~= 0
        flag(j,j+1) = 1;
    end
end
for j = 1:1:dim-N
    if Lt_new_next(j,j+N) ~= 0
        flag(j,j+N) = 1;
    end
end
for i = 1:1:dim-1
    if flag(i,i+1) ~= 0
        C_up(count,1) = i; 
        C_up(count,2) = i+1;
        C_up(count,3) = C_t(i,i+1);
        count = count+1;
    end
end
for i = 1:1:dim-N
    if flag(i,i+N) ~= 0
        C_up(count,1) = i; 
        C_up(count,2) = i+N;
        C_up(count,3) = C_t(i,i+N);
        count = count+1;
    end
end