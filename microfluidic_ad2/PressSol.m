%% solving pressure
function new_P = PressSol(LG,dim,N)
%MNA
p_i = zeros(dim+2,1);
p_i(1,1) = 1;   %input pressure and position
p_i(N,1) = 1;   %input pressure and position
p_i(dim+1,1) = 0;  %output pressure 
p_i(dim+2,1) = 0;  %output pressure 

LT = zeros(dim+2,dim+2);
LT(1:dim,1:dim) = LG;
LT(dim+1,dim-N+1) = 1;  %ouput Q and position
LT(dim+2,dim-2) = 1;      %ouput Q and position
LT(dim-N+1,dim+1) = 1;  %ouput Q and position
LT(dim-2,dim+2) = 1;      %ouput Q and position

flag = zeros(dim,1); %标记矩阵中没有任何连接的点（标记为1）
count = 0;

%删除矩阵中没有任何连接的点（对应的行和列）
for i = 1:1:dim
    if LG(i-count,i-count) == 0
        LT(i-count,:) = [];
        LT(:,i-count) = [];
        p_i(i-count,:) = [];
        flag(i,1) = 1;
        count = count+1;
    end 
end

P = LT\p_i;
new_P = P(1:(dim-count),1);
[m,n] = find(flag == 1);
if count ~= 0
    for j = 1:1:count
        new_P = [new_P(1:m(j)-1);0;new_P(m(j):end)]; %插入没有连接点
    end
end

end