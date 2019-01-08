function [C1,C2,B] = graphLC(P,q,N,dim)

MaxIter = 100000000;
con = zeros(500,5); %which should be changed
count = 1;
q = abs(q);
for i = 1:1:dim
    for j = 1:1:dim
        if q(i,j) ~= 0
            con(count,1) = i;
            con(count,2) = j;
            con(count,3) = q(i,j);
            count = count+1;
        end
    end
end

%% initialization
con(count:end,:) = [];
row = size(con,1);
con(:,4) = rand(row,1);
for i = 1:1:row
    if con(i,1) == 1 || con(i,2) == 1
        con(i,4) = 1;   %the input concentration 100%
        con(i,5) = 1;   %mark the pipline
    end
    if con(i,1) == N || con(i,2) == N
        con(i,4) = 0;   %the input concentration 0%
        con(i,5) = 1;   %mark the pipline
    end
end

%% divide the matrix 
A = con(1,:);
flag = 1;
for i = 1:1:row
    if i == row
        if con(i-1,1) == con(i,1)
            break;
        else
            fen(flag).node = con(i,1);
            fen(flag).connect = con(i,:);
        end
    elseif con(i,1) == con(i+1,1)
        A = [A(1:end,:);con(i+1,:)];
        fen(flag).node = con(i,1);
        fen(flag).connect = A;
    elseif con(i,1) ~= con(i+1,1) && con(i,1) ~= con(i-1,1)
        fen(flag).node = con(i,1);
        fen(flag).connect = con(i,:);
        A = con(i+1,:);
        flag = flag+1;
    else
        A = con(i+1,:);
        flag = flag+1;
    end
end

%% main function
counter = 0;
[row_s,col_s] = size(fen);
C = con(:,4);
out_node1 = 21;
out_node2 = 23;
for i = 1:1:MaxIter
    Ct = C;
    for node = 1:1:col_s
        if node == 1 || node == N || node == out_node1 || node == out_node2 %input and output
            continue;            
        else
            fen(node).connect = cal_c(fen(node).connect,P);
            fen = update(fen(node).connect,fen);
        end
    end
    [B,C,C1,C2] = cal_o(fen,out_node1,out_node2);
    counter = counter + 1;
    Rmse = sqrt(sum((C-Ct).^2)/row);
    if (Rmse < 1e-6)
        break;
    end
end


end

%% the function is aimed for calculating the concentration
% requirement: at least one input and one output 
function A = cal_c(A,P)
    [row,col] = size(A);
    % judge the flow direction
    for i = 1:1:row
        if P(A(i,1),1) < P(A(i,2),1)
            A(i,5) = 1;
        elseif P(A(i,1),1) > P(A(i,2),1)
            A(i,5) = -1;
        else
            fprintf('error\n');
        end
    end
    m = find(A(:,5)==1);
    n = find(A(:,5)==-1);
    C_i = 0;
    Q_i = 0;
    [row_m,col_m] = size(m);
    [row_n,col_n] = size(n);
    if row_m == 1
        A(:,4)  = A(m,4);
    else 
        for i = 1:1:row_m
            C_i = C_i+A(m(i),3)*A(m(i),4);
            Q_i = Q_i+A(m(i),3);
        end
        C_o = C_i/Q_i;
        for j = 1:1:row_n
            A(n(j),4) = C_o;
        end
    end
end

%% the function is aimed for calculating output
function [A,C,C_o1,C_o2] = cal_o(fen,node1,node2)
    A = fen(1).connect; %which should be changed
    [row,col] = size(fen);
    for i = 2:1:col
        A = [A;fen(i).connect];
    end
    
    %calculate the output node1
    m_s1 = find(A(:,2) == node1);
    m_o1 = find(A(:,1) == node1);
    [row_m1,col_m1] = size(m_s1);
    C_i1 = 0;
    Q_o1 = 0;
    for i = 1:1:row_m1
        A(m_o1(i),4) = A(m_s1(i),4);
        C_i1 = C_i1+A(m_o1(i),4)*A(m_o1(i),3);
        Q_o1 = Q_o1+A(m_o1(i),3);
    end
    C_o1 = C_i1/Q_o1;
    
    %calculate the output node2
    m_s2 = find(A(:,2) == node2);
    m_o2 = find(A(:,1) == node2);
    [row_m2,col_m2] = size(m_s2);
    C_i2 = 0;
    Q_o2 = 0;
    for i = 1:1:row_m2
        A(m_o2(i),4) = A(m_s2(i),4);
        C_i2 = C_i2+A(m_o2(i),4)*A(m_o2(i),3);
        Q_o2 = Q_o1+A(m_o2(i),3);
    end
    C_o2 = C_i2/Q_o2;
    
    C = A(:,4);
end

%% update the values
function fen = update(A,fen)
    m = find(A(:,5) == -1);
    [row,col] = size(m);
    for i = 1:1:row
        n = fen(A(m(i),2)).connect;
        flag = find(n(:,2) == A(1,1));
        n(flag,4) = A(m(i),4);
        fen(A(m(i),2)).connect = n;
    end
end

