function plot_fig(LG,N,dim)

Lg = ones(dim,dim);
Lg(~logical(abs(LG))) = 0;

figure 
for i = 1:1:N
    row = 1:1:N;
    col = i; 
    plot(row,col,'ro');
    hold on;
end
axis square

%取出网格的横向连线
LG_row = diag(Lg,1);
for k = 1:1:N-1
    LG_row(k*(N-1)+1) = [];
end
%坐标变换
count_row = 0;
for j = 1:1:dim-N
    rem = mod(j,N-1);
    if rem == 1 
        count_row = count_row+1;
        for k = 1:1:N-1
            if LG_row(j+k-1,1) == 1
                plot([k,k+1],[N+1-count_row,N+1-count_row],'b-','LineWidth',1.5);
                hold on;
            end
        end
    end
end

%取出网格的纵向连线
LG_col = diag(Lg,N);
count_col = 0;
for j = 1:1:dim-N
    rem = mod(j,N);
    if rem == 1 
        count_col = count_col+1;
        for k = 1:1:N
            if LG_col(j+k-1,1) == 1
                plot([k,k],[N-count_col,N+1-count_col],'b-','LineWidth',1.5);
                hold on;
            end
        end
    end
end
