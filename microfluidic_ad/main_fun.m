function [st,Lt,C1_t,C2_t,Pt,Qt] = main_fun(C_inil,LG_inil,C1_obj,C2_obj,C1_inil,C2_inil,lambda1,lambda2,gamma,SolTh,epsilon,dim,N)

Maxite = 50000000;
LossC =@(C1_t,C2_t,C1_obj,C2_obj,epsilon,lambda1,lambda2) lambda1*(C1_t-C1_obj-epsilon)^2+lambda2*(C2_t-C2_obj-epsilon)^2;  %loss function
LossErr =@(LossC,Lt) LossC+sum(diag(Lt))/2; %object function

%% Main function
LC = C_inil;
Lt = LG_inil;

count = 0;
J_C1 = zeros(100,1);
J_C2 = zeros(100,1);
ERR = zeros(Maxite,1);

for i = 1:1:Maxite
    % Calculate the grad
    if i == 1
        grad = CalculateGrad(C1_inil,C2_inil,C1_obj,C2_obj,Lt,epsilon,lambda1,lambda2,N);
        step_size = gamma/i;
        Lt_next = LaplacianPro(Lt,grad,step_size);
    else
        grad = CalculateGrad_pro(C1_obj,C2_obj,Lt,Lt_next,epsilon,lambda1,lambda2,N);
        Lt = Lt_next;
        % Improving learning rate   
        step_size = gamma/i;
        % update the Lt  
        Lt_next = LaplacianPro(Lt_next,grad,step_size);
    end
    
    %判断网格是否可用
    flag = start_all(Lt_next,dim,N);
    if flag == 1
        st = -1;
        fprintf('restart\n');
        break;
    end
    if mod(i,1000) == 0
        count = count+1;
        J_C1(count,1) = C1_t;
        J_C2(count,1) = C2_t;
        if count>2
            if abs(J_C1(count,1)-J_C1(count-1,1))<1e-4 || abs(J_C2(count,1)-J_C2(count-1,1))<1e-4
                st = -1;
                fprintf('restart\n');
                break;
            end
        end
    end
    
    Pt = PressSol(Lt_next,dim,N);
    Qt = graphLQ(Pt,Lt_next);
    [C1_t,C2_t,LC] = graphLC_pro(Pt,Lt_next,Qt,N);
    
    C_err = LossC(C1_t,C2_t,C1_obj,C2_obj,epsilon,lambda1,lambda2);
    ERR(i,1) = LossErr(C_err,Lt_next);
    fprintf('iteration %d\n',i);
    if i>1 && (abs(ERR(i,1)-ERR(i-1,1)) < SolTh)
        plot_fig(Lt,N,dim);
        st = 1;
        break;
    end
end

end


%% start all
function st = start_all(Lt,dim,N)
Lt = abs(Lt);
Lt(Lt==0) = inf;
Lt = Lt-diag(diag(Lt));
[d1,path1] = mydijkstra(Lt,1,dim-N+1);
[d2,path2] = mydijkstra(Lt,1,dim);
[d3,path3] = mydijkstra(Lt,N,dim-N+1);
[d4,path4] = mydijkstra(Lt,N,dim);
st = 0;
if d1 == inf || d2 == inf || d3 == inf || d4 == inf
    st = 1;
end

end