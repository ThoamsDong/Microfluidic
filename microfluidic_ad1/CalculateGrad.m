%% calculate the gradient
function grad = CalculateGrad(C1_inil,C2_inil,C1_obj,C2_obj,LG_inil,epsilon,lambda1,lambda2,N)

    LossC =@(C1_t,C2_t,C1_obj,C2_obj,epsilon,lambda1,lambda2) lambda1*(C1_t-C1_obj-epsilon)^2+lambda2*(C2_t-C2_obj-epsilon)^2; %loss function
    LossErr =@(LossC,Lt) LossC+sum(diag(Lt))/2; %object function
    
    Lg = LG_inil;
    dim = size(LG_inil,1);
    grad = zeros(dim,dim);
    
    LossC_inil = LossC(C1_inil,C2_inil,C1_obj,C2_obj,epsilon,lambda1,lambda2);
    LossErr_inil = LossErr(LossC_inil,LG_inil);
    
    for i = 1:1:dim-1
        if Lg(i,i+1) ~= 0
            Lg(i,i+1) = Lg(i,i+1)+rand(1)*0.02-0.01;
            Lg(i+1,i) = Lg(i,i+1);
            
            P = PressSol(Lg,dim,N);
            Q = graphLQ(P,Lg);
            [C1,C2,C] = graphLC_pro(P,Lg,Q,N);
            LossC_t = LossC(C1,C2,C1_obj,C2_obj,epsilon,lambda1,lambda2);
            LossErr_t = LossErr(LossC_t,Lg);
            
            grad(i,i+1) = (LossErr_t-LossErr_inil)/(Lg(i,i+1)-LG_inil(i,i+1));
            grad(i+1,i) = grad(i,i+1);
            
            Lg(i,i+1) = LG_inil(i,i+1);
            Lg(i+1,i) = Lg(i,i+1);
        end
    end
    for i = 1:1:dim-N
        if Lg(i,i+N) ~= 0
            Lg(i,i+N) = Lg(i,i+N)+rand(1)*0.02-0.01;
            Lg(i+N,i) = Lg(i,i+N);
            
            P = PressSol(Lg,dim,N);
            Q = graphLQ(P,Lg);
            [C1,C2,C] = graphLC_pro(P,Lg,Q,N);
            LossC_t = LossC(C1,C2,C1_obj,C2_obj,epsilon,lambda1,lambda2);
            LossErr_t = LossErr(LossC_t,Lg);
            
            grad(i,i+N) = (LossErr_t-LossErr_inil)/(Lg(i,i+N)-LG_inil(i,i+N));
            grad(i+N,i) = grad(i,i+N);
            
            Lg(i,i+N) = LG_inil(i,i+N);
            Lg(i+N,i) = Lg(i,i+N);
        end
    end

%     L1_norm_grad = -1*ones(dim,dim);
%     L1_norm_grad(logical(eye(size(L1_norm_grad)))) = dim-1;
%     grad = grad+lambda*L1_norm_grad;
end