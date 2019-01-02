%% ��ߵ㣨�м������㣩
function C=C_leftcolumn(LG,P,C,Q,row,N,dim)
if LG(row,row-N)==0 && LG(row,row+1)==0 && LG(row,row+N)==0
    C(row,row-N) = 0;
    C(row,row+1) = 0;
    C(row,row+N) = 0;
    C(row-N,row) = 0; %����ԳƲ���
    C(row+1,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-N)==1 && LG(row,row+1)==0 && LG(row,row+N)==0
    C(row,row-N) = 0;
    C(row,row+1) = 0;
    C(row,row+N) = 0;
    C(row-N,row) = 0; %����ԳƲ���
    C(row+1,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-N)==0 && LG(row,row+1)==1 && LG(row,row+N)==0
    C(row,row-N) = 0;
    C(row,row+1) = 0;
    C(row,row+N) = 0;
    C(row-N,row) = 0; %����ԳƲ���
    C(row+1,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-N)==0 && LG(row,row+1)==0 && LG(row,row+N)==1
    C(row,row-N) = 0;
    C(row,row+1) = 0;
    C(row,row+N) = 0;
    C(row-N,row) = 0; %����ԳƲ���
    C(row+1,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-N)==1 && LG(row,row+1)==0 && LG(row,row+N)==1
    C(row,row+1) = 0;
    C(row+1,row) = 0;
    if P(row-N,1)>P(row,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = C(row,row-N);
        C(row+N,row) = C(row,row+N); %����ԳƲ���
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row+N,1)
        C(row,row-N) = C(row,row+N);
        C(row-N,row) = C(row,row-N); %����ԳƲ���
    else
%         plot_fig(LG,N,dim);
        fprintf('error_leftcolumn_101\n');
    end
elseif LG(row,row-N)==0 && LG(row,row+1)==1 && LG(row,row+N)==1
    C(row,row-N) = 0;
    C(row-N,row) = 0;
    if P(row+1,1)>P(row,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = C(row,row+1);
        C(row+N,row) = C(row,row+N); %����ԳƲ���
    elseif P(row+1,1)<P(row,1) && P(row,1)<P(row+N,1)
        C(row,row+1) = C(row,row+N);
        C(row+1,row) = C(row,row+1); %����ԳƲ���
    else
%         plot_fig(LG,N,dim);
        fprintf('error_leftcolumn_011\n');
    end
elseif LG(row,row-N)==1 && LG(row,row+1)==1 && LG(row,row+N)==0
    C(row,row+N) = 0;
    C(row+N,row) = 0;
    if P(row-N,1)>P(row,1) && P(row,1)>P(row+1,1)
        C(row,row+1) = C(row,row-N);
        C(row+1,row) = C(row,row+1); %����ԳƲ���
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row+1,1)
        C(row,row-N) = C(row,row+1);
        C(row-N,row) = C(row,row-N); %����ԳƲ���
    else
%         plot_fig(LG,N,dim);
        fprintf('error_leftcolumn_110\n');
    end
elseif LG(row,row-N)==1 && LG(row,row+1)==1 && LG(row,row+N)==1
    if P(row-N,1)>P(row,1) && P(row+1,1)<P(row,1) && P(row+N,1)<P(row,1)
        C(row,row+1) = C(row,row-N);
        C(row,row+N) = C(row,row-N);
        C(row+1,row) = C(row,row+1); %����ԳƲ���
        C(row+N,row) = C(row,row+N);
    elseif P(row-N,1)>P(row,1) && P(row+1,1)>P(row,1) && P(row+N,1)<P(row,1)
        C(row,row+N) = (C(row,row-N)*Q(row,row-N)+C(row,row+1)*Q(row,row+1))/Q(row,row+N);
        C(row+N,row) = C(row,row+N); %����ԳƲ���
    elseif P(row-N,1)>P(row,1) && P(row+1,1)<P(row,1) && P(row+N,1)>P(row,1)
        C(row,row+1) = (C(row,row-N)*Q(row,row-N)+C(row,row+N)*Q(row,row+N))/Q(row,row+1);
        C(row+1,row) = C(row,row+1); %����ԳƲ���
    elseif P(row-N,1)<P(row,1) && P(row+1,1)<P(row,1) && P(row+N,1)>P(row,1)
        C(row,row+1) = C(row,row+N);
        C(row,row-N) = C(row,row+N);
        C(row+1,row) = C(row,row+1); %����ԳƲ���
        C(row-N,row) = C(row,row-N);
    elseif P(row-N,1)<P(row,1) && P(row+1,1)>P(row,1) && P(row+N,1)<P(row,1)
        C(row,row+N) = C(row,row+1);
        C(row,row-N) = C(row,row+1);
        C(row+N,row) = C(row,row+N); %����ԳƲ���
        C(row-N,row) = C(row,row-N);
    elseif P(row-N,1)<P(row,1) && P(row+1,1)>P(row,1) && P(row+N,1)>P(row,1)
        C(row,row-N) = (C(row,row+1)*Q(row,row+1)+C(row,row+N)*Q(row,row+N))/Q(row,row-N);
        C(row-N,row) = C(row,row-N); %����ԳƲ���
    else
%         plot_fig(LG,N,dim);
        fprintf('error_leftcolumn_111\n');
    end
else
%     plot_fig(LG,N,dim);
    fprintf('error_leftcolumn\n');
end

end