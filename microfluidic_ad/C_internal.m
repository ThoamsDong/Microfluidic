%% ÄÚ²¿µã
function C=C_internal(LG,P,C,Q,row,N,dim)
if LG(row,row-1)==0 && LG(row,row+1)==0 && LG(row,row-N)==0 && LG(row,row+N)==0  %0000
    C(row,row-1) = 0;
    C(row,row+1) = 0;
    C(row,row-N) = 0;
    C(row,row+N) = 0;
    C(row-1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row+1,row) = 0;
    C(row-N,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-1)==1 && LG(row,row+1)==0 && LG(row,row-N)==0 && LG(row,row+N)==0  %1000
    C(row,row-1) = 0;
    C(row,row+1) = 0;
    C(row,row-N) = 0;
    C(row,row+N) = 0;
    C(row-1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row+1,row) = 0;
    C(row-N,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-1)==0 && LG(row,row+1)==1 && LG(row,row-N)==0 && LG(row,row+N)==0  %0100
    C(row,row-1) = 0;
    C(row,row+1) = 0;
    C(row,row-N) = 0;
    C(row,row+N) = 0;
    C(row-1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row+1,row) = 0;
    C(row-N,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-1)==0 && LG(row,row+1)==0 && LG(row,row-N)==1 && LG(row,row+N)==0  %0010
    C(row,row-1) = 0;
    C(row,row+1) = 0;
    C(row,row-N) = 0;
    C(row,row+N) = 0;
    C(row-1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row+1,row) = 0;
    C(row-N,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-1)==0 && LG(row,row+1)==0 && LG(row,row-N)==0 && LG(row,row+N)==1  %0001
    C(row,row-1) = 0;
    C(row,row+1) = 0;
    C(row,row-N) = 0;
    C(row,row+N) = 0;
    C(row-1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row+1,row) = 0;
    C(row-N,row) = 0;
    C(row+N,row) = 0;
elseif LG(row,row-1)==1 && LG(row,row+1)==0 && LG(row,row-N)==1 && LG(row,row+N)==0     %1010 
    C(row,row+1) = 0;    
    C(row,row+N) = 0;
    C(row+1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row+N,row) = 0;
    if P(row-N,1)>P(row,1) && P(row,1)>P(row-1,1)
        C(row,row-1) = C(row,row-N);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row-1,1)
        C(row,row-N) = C(row,row-1);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_1010\n');
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==1 && LG(row,row-N)==0 && LG(row,row+N)==0     %1100
    C(row,row-N) = 0;
    C(row,row+N) = 0;
    C(row-N,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row+N,row) = 0;
    if P(row+1,1)>P(row,1) && P(row,1)>P(row-1,1)
        C(row,row-1) = C(row,row+1);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row+1,1)<P(row,1) && P(row,1)<P(row-1,1)
        C(row,row+1) = C(row,row-1);
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_1100\n');
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==0 && LG(row,row-N)==0 && LG(row,row+N)==1     %1001
    C(row,row+1) = 0;    
    C(row,row-N) = 0;
    C(row+1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row-N,row) = 0;
    if P(row-1,1)>P(row,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = C(row,row-1);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-1,1)<P(row,1) && P(row,1)<P(row+N,1)
        C(row,row-1) = C(row,row+N);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_1001\n');
    end
elseif LG(row,row-1)==0 && LG(row,row+1)==0 && LG(row,row-N)==1 && LG(row,row+N)==1     %0011
    C(row,row+1) = 0;    
    C(row,row-1) = 0;
    C(row+1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row-1,row) = 0;
    if P(row-N,1)>P(row,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = C(row,row-N);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row+N,1)
        C(row,row-N) = C(row,row+N);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷ 
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_0011\n');
    end
elseif LG(row,row-1)==0 && LG(row,row+1)==1 && LG(row,row-N)==1 && LG(row,row+N)==0     %0110
    C(row,row-1) = 0;    
    C(row,row+N) = 0;
    C(row-1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷    
    C(row+N,row) = 0;
    if P(row-N,1)>P(row,1) && P(row,1)>P(row+1,1)
        C(row,row+1) = C(row,row-N);
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row+1,1)
        C(row,row-N) = C(row,row+1);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_0110\n');
    end
elseif LG(row,row-1)==0 && LG(row,row+1)==1 && LG(row,row-N)==0 && LG(row,row+N)==1     %0101
    C(row,row-1) = 0;    
    C(row,row-N) = 0;
    C(row-1,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    C(row-N,row) = 0;
    if P(row+1,1)>P(row,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = C(row,row+1);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row+1,1)<P(row,1) && P(row,1)<P(row+N,1)
        C(row,row+1) = C(row,row+N);
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_0101\n');
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==1 && LG(row,row-N)==1 && LG(row,row+N)==0     %1110  
    C(row,row+N) = 0;
    C(row+N,row) = 0; %¾ØÕó¶Ô³Æ²Ù×÷
    if P(row-N,1)>P(row,1) && P(row,1)>P(row-1,1) && P(row,1)>P(row+1,1)
        C(row,row-1) = C(row,row-N);
        C(row,row+1) = C(row,row-N);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
    elseif P(row-N,1)>P(row,1) && P(row,1)<P(row-1,1) && P(row,1)>P(row+1,1)
        C(row,row+1) = (C(row,row-1)*Q(row,row-1)+C(row,row-N)*Q(row,row-N))/Q(row,row+1);
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)>P(row,1) && P(row,1)>P(row-1,1) && P(row,1)<P(row+1,1)
        C(row,row-1) = (C(row,row+1)*Q(row,row+1)+C(row,row-N)*Q(row,row-N))/Q(row,row-1);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row-1,1) && P(row,1)>P(row+1,1)
        C(row,row-N) = C(row,row-1);
        C(row,row+1) = C(row,row-1); 
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1); 
    elseif P(row-N,1)<P(row,1) && P(row,1)>P(row-1,1) && P(row,1)<P(row+1,1)
        C(row,row-N) = C(row,row+1);
        C(row,row-1) = C(row,row+1); 
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row-1,row) = C(row,row-1);
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row-1,1) && P(row,1)<P(row+1,1)
        C(row,row-N) = (C(row,row-1)*Q(row,row-1)+C(row,row+1)*Q(row,row+1))/Q(row,row-N);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_1110\n');
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==0 && LG(row,row-N)==1 && LG(row,row+N)==1     %1011
    C(row,row+1) = 0;
    C(row+1,row) = 0;%¾ØÕó¶Ô³Æ²Ù×÷
    if P(row-N,1)>P(row,1) && P(row,1)>P(row-1,1) && P(row,1)>P(row+N,1)
        C(row,row-1) = C(row,row-N);
        C(row,row+N) = C(row,row-N);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+N,row) = C(row,row+N);
    elseif P(row-N,1)>P(row,1) && P(row,1)<P(row-1,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = (C(row,row-1)*Q(row,row-1)+C(row,row-N)*Q(row,row-N))/Q(row,row+N);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)>P(row,1) && P(row,1)>P(row-1,1) && P(row,1)<P(row+N,1)
        C(row,row-1) = (C(row,row+N)*Q(row,row+N)+C(row,row-N)*Q(row,row-N))/Q(row,row-1);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row-1,1) && P(row,1)>P(row+N,1)
        C(row,row-N) = C(row,row-1);
        C(row,row+N) = C(row,row-1);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+N,row) = C(row,row+N);
    elseif P(row-N,1)<P(row,1) && P(row,1)>P(row-1,1) && P(row,1)<P(row+N,1)
        C(row,row-N) = C(row,row+N);
        C(row,row-1) = C(row,row+N);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row-1,row) = C(row,row-1);
    elseif P(row-N,1)<P(row,1) && P(row,1)<P(row-1,1) && P(row,1)<P(row+N,1)
        C(row,row-N) = (C(row,row-1)*Q(row,row-1)+C(row,row+N)*Q(row,row+N))/Q(row,row-N);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_1011\n');
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==1 && LG(row,row-N)==0 && LG(row,row+N)==1     %1101
    C(row,row-N) = 0;
    C(row-N,row) = 0;
    if P(row+1,1)<P(row,1) && P(row,1)<P(row-1,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = C(row,row-1);
        C(row,row+1) = C(row,row-1);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
    elseif P(row+1,1)>P(row,1) && P(row,1)<P(row-1,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = (C(row,row-1)*Q(row,row-1)+C(row,row+1)*Q(row,row+1))/Q(row,row+N);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row+1,1)<P(row,1) && P(row,1)<P(row-1,1) && P(row,1)<P(row+N,1)
        C(row,row+1) = (C(row,row-1)*Q(row,row-1)+C(row,row+N)*Q(row,row+N))/Q(row,row+1);
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row+1,1)>P(row,1) && P(row,1)>P(row-1,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = C(row,row+1);
        C(row,row-1) = C(row,row+1);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row-1,row) = C(row,row-1);
    elseif P(row+1,1)>P(row,1) && P(row,1)>P(row-1,1) && P(row,1)<P(row+N,1)
        C(row,row-1) = (C(row,row+1)*Q(row,row+1)+C(row,row+N)*Q(row,row+N))/Q(row,row-1);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row+1,1)<P(row,1) && P(row,1)>P(row-1,1) && P(row,1)<P(row+N,1)
        C(row,row+1) = C(row,row+N);
        C(row,row-1) = C(row,row+N);
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row-1,row) = C(row,row-1);
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_1101\n');
    end
elseif LG(row,row-1)==0 && LG(row,row+1)==1 && LG(row,row-N)==1 && LG(row,row+N)==1     %0111
    C(row,row-1) = 0;
    C(row-1,row) = 0;
    if P(row+1,1)<P(row,1) && P(row,1)<P(row-N,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = C(row,row-N);
        C(row,row+1) = C(row,row-N);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
    elseif P(row+1,1)<P(row,1) && P(row,1)<P(row-N,1) && P(row,1)<P(row+N,1)
        C(row,row+1) = (C(row,row-N)*Q(row,row-N)+C(row,row+N)*Q(row,row+N))/Q(row,row+1);
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row+1,1)>P(row,1) && P(row,1)<P(row-N,1) && P(row,1)>P(row+N,1)
        C(row,row+N) = (C(row,row-N)*Q(row,row-N)+C(row,row+1)*Q(row,row+1))/Q(row,row+N);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row+1,1)<P(row,1) && P(row,1)>P(row-N,1) && P(row,1)<P(row+N,1)
        C(row,row-N) = C(row,row+N);
        C(row,row+1) = C(row,row+N);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
    elseif P(row+1,1)>P(row,1) && P(row,1)>P(row-N,1) && P(row,1)>P(row+N,1)
        C(row,row-N) = C(row,row+1);
        C(row,row+N) = C(row,row+1);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+N,row) = C(row,row+N);
    elseif P(row+1,1)>P(row,1) && P(row,1)>P(row-N,1) && P(row,1)<P(row+N,1)
        C(row,row-N) = (C(row,row+1)*Q(row,row+1)+C(row,row+N)*Q(row,row+N))/Q(row,row-N);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_0111\n');
    end
elseif LG(row,row-1)==1 && LG(row,row+1)==1 && LG(row,row-N)==1 && LG(row,row+N)==1     %1111
    if P(row-N,1)>P(row,1) && P(row+N,1)<P(row,1) && P(row-1,1)<P(row,1) && P(row+1,1)<P(row,1)
        C(row,row+N) = C(row,row-N);
        C(row,row+1) = C(row,row-N);
        C(row,row-1) = C(row,row-N);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
        C(row-1,row) = C(row,row-1);
    elseif P(row-N,1)<P(row,1) && P(row+N,1)>P(row,1) && P(row-1,1)<P(row,1) && P(row+1,1)<P(row,1)
        C(row,row-N) = C(row,row+N);
        C(row,row+1) = C(row,row+N);
        C(row,row-1) = C(row,row+N);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
        C(row-1,row) = C(row,row-1);
    elseif P(row-N,1)>P(row,1) && P(row+N,1)<P(row,1) && P(row-1,1)>P(row,1) && P(row+1,1)>P(row,1)
        C(row,row+N) = (C(row,row-1)*Q(row,row-1)+C(row,row+1)*Q(row,row+1)+C(row,row-N)*Q(row,row-N))/Q(row,row+N);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)<P(row,1) && P(row+N,1)>P(row,1) && P(row-1,1)>P(row,1) && P(row+1,1)>P(row,1)
        C(row,row-N) = (C(row,row-1)*Q(row,row-1)+C(row,row+1)*Q(row,row+1)+C(row,row+N)*Q(row,row+N))/Q(row,row-N);
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)>P(row,1) && P(row+N,1)<P(row,1) && P(row-1,1)<P(row,1) && P(row+1,1)>P(row,1)
        C(row,row+N) = (C(row,row-N)*Q(row,row-N)+C(row,row+1)*Q(row,row+1))/(Q(row,row+N)+Q(row,row-1));
        C(row,row-1) = (C(row,row-N)*Q(row,row-N)+C(row,row+1)*Q(row,row+1))/(Q(row,row+N)+Q(row,row-1));
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row-1,row) = C(row,row-1);
    elseif P(row-N,1)>P(row,1) && P(row+N,1)<P(row,1) && P(row-1,1)>P(row,1) && P(row+1,1)<P(row,1)
        C(row,row+N) = (C(row,row-N)*Q(row,row-N)+C(row,row-1)*Q(row,row-1))/(Q(row,row+N)+Q(row,row+1));
        C(row,row+1) = (C(row,row-N)*Q(row,row-N)+C(row,row-1)*Q(row,row-1))/(Q(row,row+N)+Q(row,row+1));
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
    elseif P(row-N,1)>P(row,1) && P(row+N,1)>P(row,1) && P(row-1,1)>P(row,1) && P(row+1,1)<P(row,1)
        C(row,row+1) = (C(row,row-N)*Q(row,row-N)+C(row,row-1)*Q(row,row-1)+C(row,row+N)*Q(row,row+N))/Q(row,row+1);
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)>P(row,1) && P(row+N,1)>P(row,1) && P(row-1,1)<P(row,1) && P(row+1,1)>P(row,1)
        C(row,row-1) = (C(row,row-N)*Q(row,row-N)+C(row,row+1)*Q(row,row+1)+C(row,row+N)*Q(row,row+N))/Q(row,row-1);
        C(row-1,row) = C(row,row-1); %¾ØÕó¶Ô³Æ²Ù×÷
    elseif P(row-N,1)<P(row,1) && P(row+N,1)<P(row,1) && P(row-1,1)>P(row,1) && P(row+1,1)<P(row,1)
        C(row,row+N) = C(row,row-1);
        C(row,row+1) = C(row,row-1);
        C(row,row-N) = C(row,row-1);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
        C(row-N,row) = C(row,row-N);
    elseif P(row-N,1)<P(row,1) && P(row+N,1)<P(row,1) && P(row-1,1)<P(row,1) && P(row+1,1)>P(row,1)
        C(row,row+N) = C(row,row+1);
        C(row,row-1) = C(row,row+1);
        C(row,row-N) = C(row,row+1);
        C(row+N,row) = C(row,row+N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row-1,row) = C(row,row-1);
        C(row-N,row) = C(row,row-N);
    elseif P(row-N,1)<P(row,1) && P(row+N,1)>P(row,1) && P(row-1,1)>P(row,1) && P(row+1,1)<P(row,1)
        C(row,row-N) = (C(row,row+N)*Q(row,row+N)+C(row,row-1)*Q(row,row-1))/(Q(row,row-N)+Q(row,row+1));
        C(row,row+1) = (C(row,row+N)*Q(row,row+N)+C(row,row-1)*Q(row,row-1))/(Q(row,row-N)+Q(row,row+1));
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+1,row) = C(row,row+1);
    elseif P(row-N,1)<P(row,1) && P(row+N,1)>P(row,1) && P(row-1,1)<P(row,1) && P(row+1,1)>P(row,1)
        C(row,row-N) = (C(row,row+N)*Q(row,row+N)+C(row,row+1)*Q(row,row+1))/(Q(row,row-N)+Q(row,row-1));
        C(row,row-1) = (C(row,row+N)*Q(row,row+N)+C(row,row+1)*Q(row,row+1))/(Q(row,row-N)+Q(row,row-1));
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row-1,row) = C(row,row-1);
    elseif P(row-N,1)>P(row,1) && P(row+N,1)>P(row,1) && P(row-1,1)<P(row,1) && P(row+1,1)<P(row,1)
        C(row,row+1) = (C(row,row+N)*Q(row,row+N)+C(row,row-N)*Q(row,row-N))/(Q(row,row+1)+Q(row,row-1));
        C(row,row-1) = (C(row,row+N)*Q(row,row+N)+C(row,row-N)*Q(row,row-N))/(Q(row,row+1)+Q(row,row-1));
        C(row+1,row) = C(row,row+1); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row-1,row) = C(row,row-1);
    elseif P(row-N,1)<P(row,1) && P(row+N,1)<P(row,1) && P(row-1,1)>P(row,1) && P(row+1,1)>P(row,1)
        C(row,row-N) = (C(row,row-1)*Q(row,row-1)+C(row,row+1)*Q(row,row+1))/(Q(row,row-N)+Q(row,row+N));
        C(row,row+N) = (C(row,row-1)*Q(row,row-1)+C(row,row+1)*Q(row,row+1))/(Q(row,row-N)+Q(row,row+N));
        C(row-N,row) = C(row,row-N); %¾ØÕó¶Ô³Æ²Ù×÷
        C(row+N,row) = C(row,row+N);
    else
%         plot_fig(LG,N,dim);
        fprintf('error_internal_1111\n');
    end
else
%     plot_fig(LG,N,dim);
    fprintf('error_internal\n');
end
end