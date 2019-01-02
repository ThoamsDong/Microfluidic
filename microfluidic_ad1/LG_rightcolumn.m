%% 右边点（中间三个点）
function LG=LG_rightcolumn(LG,P,row,N,dim)
if LG(row,row-N)==0 && LG(row,row-1)==0 && LG(row,row+N)==0
    LG(row,row-N) = 0;
    LG(row-N,row) = 0;
    LG(row,row-1) = 0;
    LG(row-1,row) = 0;
    LG(row,row+N) = 0;
    LG(row+N,row) = 0;
elseif LG(row,row-N)==1 && LG(row,row-1)==0 && LG(row,row+N)==0
    LG(row,row-N) = 0;
    LG(row-N,row) = 0;
elseif LG(row,row-N)==0 && LG(row,row-1)==1 && LG(row,row+N)==0
    LG(row,row-1) = 0;
    LG(row-1,row) = 0;
elseif LG(row,row-N)==0 && LG(row,row-1)==0 && LG(row,row+N)==1
    LG(row,row+N) = 0;
    LG(row+N,row) = 0;
elseif LG(row,row-N)==1 && LG(row,row-1)==0 && LG(row,row+N)==1
    if P(row-N,1)==P(row,1) || P(row,1)==P(row+N,1)
        if P(row-N,1)==P(row,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
        if P(row,1)==P(row+N,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
    end
elseif LG(row,row-N)==0 && LG(row,row-1)==1 && LG(row,row+N)==1
    if P(row-1,1)==P(row,1) || P(row,1)==P(row+N,1)
        if P(row-1,1)==P(row,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
        if P(row,1)==P(row+N,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
    end
elseif LG(row,row-N)==1 && LG(row,row-1)==1 && LG(row,row+N)==0
    if P(row-N,1)==P(row,1) || P(row,1)==P(row-1,1)
        if P(row-1,1)==P(row,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
        if P(row,1)==P(row-N,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
    end
elseif LG(row,row-N)==1 && LG(row,row-1)==1 && LG(row,row+N)==1
    if P(row-N,1)==P(row,1) == P(row-1,1)==P(row,1) && P(row+N,1)==P(row,1)
        if P(row-1,1)==P(row,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
        if P(row,1)==P(row-N,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
        if P(row,1)==P(row+N,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
    end
else
    plot_fig(LG,N,dim);
    fprintf('LG_error_rightcolumn\n');
end

end