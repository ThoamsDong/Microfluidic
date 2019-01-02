%% solving pressure
function new_P = PressSol(LG,dim,N)
p_i = zeros(dim+2,1);
p_i(1,1) = 1;   %input pressure and position
p_i(N,1) = 1;   %input pressure and position
p_i(dim+1,1) = 0;  %output pressure 
p_i(dim+2,1) = 0;  %output pressure 

LT = zeros(dim+2,dim+2);
LT(1:dim,1:dim) = LG;
LT(dim+1,dim-N+1) = 1;  %ouput Q and position
LT(dim+2,dim) = 1;      %ouput Q and position
LT(dim-N+1,dim+1) = 1;  %ouput Q and position
LT(dim,dim+2) = 1;      %ouput Q and position

LG_log = ones(dim,dim);
LG_log(~logical(abs(LG))) = 0;
flag = zeros(dim,1); %标记矩阵中没有任何连接的点（标记为1）
count = 0;

%删除矩阵中没有任何连接的点（对应的行和列）
for i = 1:1:dim
    if i<N && i>1
        if (LG_log(i,i+1)+LG_log(i,i-1)+LG_log(i,i+N)) == 0
            LT(i-count,:) = [];
            LT(:,i-count) = [];
            p_i(i-count,:) = [];
            flag(i,1) = 1;
            count = count+1;
        end
    elseif i>N && i<dim-N+1
        if (LG_log(i,i+1)+LG_log(i,i-1)+LG_log(i,i+N)+LG_log(i,i-N)) == 0
            LT(i-count,:) = [];
            LT(:,i-count) = [];
            p_i(i-count,:) = [];
            flag(i,1) = 1;
            count = count+1;
        end
    elseif i >dim-N+1 && i<dim
        if (LG_log(i,i+1)+LG_log(i,i-1)+LG_log(i,i-N)) == 0
            LT(i-count,:) = [];
            LT(:,i-count) = [];
            p_i(i-count,:) = [];
            flag(i,1) = 1;
            count = count+1;
        end
    end   
end

P = LT\p_i;
new_P = P(1:(dim-count),1);
[m,n] = find(flag == 1);
if count ~= 0
    new_P = new_P';
    for j = 1:1:count
        new_P = [new_P(1:m(j)-1),0,new_P(m(j):end)]; 
        %数组中插入元素，需要转置成行进行变换
    end
    new_P = new_P';
end

end