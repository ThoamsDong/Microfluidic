function [C1,C2,C] = graphLC_pro(P,LG,Q,N)
% P is a colum about grid pressure
% Q is a matrix about channel flow rate which must be abs
% LG is a matrix about grid connection
MaxIter = 100000000;
count = 0;
%% initialize
Q = abs(Q); %the matrix of Q may not absolute
dim = size(Q,1);
C = rand(dim,dim);  %rand matrix which prevent iteration problem
C(~logical(LG)) = 0; %no connection,no concentration
if LG(1,2) == 0
    C(1,2) = 0;
    C(2,1) = 0;
else
    C(1,2) = 1;
    C(2,1) = 1;
end
if LG(1,6) == 0
    C(1,6) = 0;
    C(6,1) = 0;
else
    C(1,6) = 1;
    C(6,1) = 1;
end
C(5,4) = 0;
C(4,5) = 0;
C(5,10) = 0;
C(10,5) = 0;
C = 0.5*(C+(tril(C))'+(triu(C))'); %project the matrix to Laplacian Matrix
C(logical(eye(dim))) = 0;
Ct = zeros(dim,dim);
LG = logical(LG);

for row = 1:1:dim
    if row == 1||row == N
        continue;
    elseif row == dim-N+1 || row == dim
        continue;
    elseif row>1 && row<N
        LG=LG_firstrow(LG,P,row,N,dim);
    elseif row>N && row<(dim-N+1)
        if mod(row-1,5) == 0
            LG=LG_leftcolumn(LG,P,row,N,dim);
        elseif mod(row,5) == 0
            LG=LG_rightcolumn(LG,P,row,N,dim);
        else 
            LG=LG_internal(LG,P,row,N,dim);
        end
    elseif row>(dim-N+1) && row<dim
        LG=LG_lastrow(LG,P,row,N,dim);
    end
end

%% main function
% 计算网格的浓度
for i = 1:1:MaxIter
    Ct = C;
    for row = 1:1:dim
        if row == 1||row == N
            continue;
        elseif row == dim-N+1 || row == dim
            continue;
        elseif row>1 && row<N
            C=C_firstrow(LG,P,C,Q,row,N,dim);
        elseif row>N && row<(dim-N+1)
            if mod(row-1,5) == 0
                C=C_leftcolumn(LG,P,C,Q,row,N,dim);
            elseif mod(row,5) == 0
                C=C_rightcolumn(LG,P,C,Q,row,N,dim);
            else 
                C=C_internal(LG,P,C,Q,row,N,dim);
            end
        elseif row>(dim-N+1) && row<dim
            C=C_lastrow(LG,P,C,Q,row,N,dim);
        end
    end
    count = count + 1;
    Rmse = sqrt(sum(C-Ct).^2/dim);
    if (Rmse < 1e-6)
        break;
    end
end

C1 = (C(dim-N+1,dim-2*N+1)*Q(dim-N+1,dim-2*N+1)+C(dim-N+1,dim-N+2)*Q(dim-N+1,dim-N+2))...
        /(Q(dim-N+1,dim-2*N+1)+Q(dim-N+1,dim-N+2));
C2 = (C(dim,dim-N)*Q(dim,dim-N)+C(dim,dim-1)*Q(dim,dim-1))/(Q(dim,dim-N)+Q(dim,dim-1));
        
end