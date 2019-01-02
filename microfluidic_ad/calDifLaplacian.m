%% Generate Laplacian Matrix
function L = calDifLaplacian( W, type )
% W��������ڽ�/���ƾ���
% type������������˹����ķ���or��ĳЩ�㷨�е�ʵ����ʽ
% L����ֵ��������˹����
n = length(W);
D = zeros(n);
for i=1:n
    D(i,i)= sum(W(i, :));
end

if strcmp(type,'standard')
    L = D - W;
elseif strcmp(type, 'normalized')
    L = D - W;
    L = pinv(D)*L;     %D�ģ�α����*L������׼��
elseif strcmp(type, 'NJW')
    L = (D^-1/2) * A * (D^-1/2);
elseif strcmp(type, 'MS')
    L = (D^-1) * W;
end

end