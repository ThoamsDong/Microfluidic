%% ÄÚ²¿µã
function LG=LG_internal(LG,P,row,N,dim)
if LG(row,row-1)==0 && LG(row,row+1)==0 && LG(row,row-N)==0 && LG(row,row+N)==0
    LG(row,row-1) = 0;
    LG(row-1,row) = 0;
    LG(row,row+1) = 0;
    LG(row+1,row) = 0;
    LG(row,row-N) = 0;
    LG(row-N,row) = 0;
    LG(row,row+N) = 0;
    LG(row+N,row) = 0;
elseif LG(row,row-1)==1 && LG(row,row+1)==0 && LG(row,row-N)==0 && LG(row,row+N)==0  %1000
    LG(row,row-1) = 0;
    LG(row-1,row) = 0;
elseif LG(row,row-1)==0 && LG(row,row+1)==1 && LG(row,row-N)==0 && LG(row,row+N)==0  %0100
    LG(row,row+1) = 0;
    LG(row+1,row) = 0;
elseif LG(row,row-1)==0 && LG(row,row+1)==0 && LG(row,row-N)==1 && LG(row,row+N)==0  %0010
    LG(row,row-N) = 0;
    LG(row-N,row) = 0;
elseif LG(row,row-1)==0 && LG(row,row+1)==0 && LG(row,row-N)==0 && LG(row,row+N)==1  %0001
    LG(row,row+N) = 0;
    LG(row+N,row) = 0;
elseif LG(row,row-1)==1 && LG(row,row+1)==0 && LG(row,row-N)==1 && LG(row,row+N)==0     %1010 
    if P(row-N,1)==P(row,1) || P(row,1)==P(row-1,1)
        if P(row-N,1)==P(row,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
        if P(row,1)==P(row-1,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==1 && LG(row,row-N)==0 && LG(row,row+N)==0     %1100
    if P(row+1,1)==P(row,1) || P(row,1)==P(row-1,1)
        if P(row+1,1)==P(row,1)
            LG(row,row+1) = 0;
            LG(row+1,row) = 0;
        end
        if P(row,1)==P(row-1,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==0 && LG(row,row-N)==0 && LG(row,row+N)==1     %1001
    if P(row-1,1)==P(row,1) || P(row,1)==P(row+N,1)
        if P(row+N,1)==P(row,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
        if P(row,1)==P(row-1,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
    end
elseif LG(row,row-1)==0 && LG(row,row+1)==0 && LG(row,row-N)==1 && LG(row,row+N)==1     %0011
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
elseif LG(row,row-1)==0 && LG(row,row+1)==1 && LG(row,row-N)==1 && LG(row,row+N)==0     %0110
    if P(row-N,1)==P(row,1) || P(row,1)==P(row+1,1)
        if P(row-N,1)==P(row,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
        if P(row,1)==P(row+1,1)
            LG(row,row+1) = 0;
            LG(row+1,row) = 0;
        end
    end
elseif LG(row,row-1)==0 && LG(row,row+1)==1 && LG(row,row-N)==0 && LG(row,row+N)==1     %0101
    if P(row+1,1)==P(row,1) || P(row,1)==P(row+N,1)
        if P(row+N,1)==P(row,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
        if P(row,1)==P(row+1,1)
            LG(row,row+1) = 0;
            LG(row+1,row) = 0;
        end
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==1 && LG(row,row-N)==1 && LG(row,row+N)==0     %1110  
    if P(row-N,1)==P(row,1) || P(row,1)==P(row-1,1) || P(row,1)==P(row+1,1)
        if P(row,1)==P(row+1,1)
            LG(row,row+1) = 0;
            LG(row+1,row) = 0;
        end
        if P(row-N,1)==P(row,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
        if P(row,1)==P(row-1,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==0 && LG(row,row-N)==1 && LG(row,row+N)==1     %1011
    if P(row-N,1)==P(row,1) || P(row,1)==P(row-1,1) || P(row,1)==P(row+N,1)
        if P(row-N,1)==P(row,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
        if P(row,1)==P(row-1,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
        if P(row,1)==P(row+N,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==1 && LG(row,row-N)==0 && LG(row,row+N)==1     %1101
    if P(row+1,1)==P(row,1) || P(row,1)==P(row-1,1) || P(row,1)==P(row+N,1)
        if P(row,1)==P(row+1,1)
            LG(row,row+1) = 0;
            LG(row+1,row) = 0;
        end
        if P(row,1)==P(row-1,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
        if P(row,1)==P(row+N,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
    end
elseif LG(row,row-1)==0 && LG(row,row+1)==1 && LG(row,row-N)==1 && LG(row,row+N)==1     %0111
    if P(row+1,1)==P(row,1) || P(row,1)==P(row-N,1) || P(row,1)==P(row+N,1)
        if P(row,1)==P(row+1,1)
            LG(row,row+1) = 0;
            LG(row+1,row) = 0;
        end
        if P(row,1)==P(row+N,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
        if P(row-N,1)==P(row,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==1 && LG(row,row-N)==1 && LG(row,row+N)==1     %1111
    if P(row-N,1)==P(row,1) || P(row+N,1)==P(row,1) || P(row-1,1)==P(row,1) || P(row+1,1)==P(row,1)
        if P(row-N,1)==P(row,1)
            LG(row,row-N) = 0;
            LG(row-N,row) = 0;
        end
        if P(row,1)==P(row+N,1)
            LG(row,row+N) = 0;
            LG(row+N,row) = 0;
        end
        if P(row,1)==P(row-1,1)
            LG(row,row-1) = 0;
            LG(row-1,row) = 0;
        end
        if P(row,1)==P(row+1,1)
            LG(row,row+1) = 0;
            LG(row+1,row) = 0;
        end
    end
else
    plot_fig(LG,N,dim);
    fprintf('LG_error_internal\n');
end
end