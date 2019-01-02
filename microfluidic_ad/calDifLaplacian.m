%% Generate Laplacian Matrix
function L = calDifLaplacian( W, type )
% W：输入的邻接/相似矩阵
% type：计算拉普拉斯矩阵的方案or在某些算法中的实现形式
% L返回值：拉普拉斯矩阵
n = length(W);
D = zeros(n);
for i=1:n
    D(i,i)= sum(W(i, :));
end

if strcmp(type,'standard')
    L = D - W;
elseif strcmp(type, 'normalized')
    L = D - W;
    L = pinv(D)*L;     %D的（伪）逆*L——标准化
elseif strcmp(type, 'NJW')
    L = (D^-1/2) * A * (D^-1/2);
elseif strcmp(type, 'MS')
    L = (D^-1) * W;
end

end