function [C1,C2,C,LG] = graphLC(P,LG,q,N,dim)

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
        flag = flag+1;
    else
        A = con(i+1,:);
        flag = flag+1;
    end
end

%% main function
counter = 0;
for i = 1:1:MaxIter
    Ct = C;
    
    %need to complete
    
    counter = counter + 1;
    Rmse = sqrt(sum(C-Ct).^2/dim);
    if (Rmse < 1e-6)
        break;
    end
end


end
