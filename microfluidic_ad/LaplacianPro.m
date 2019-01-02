%% update graph Laplacian
function L_sparse = LaplacianPro(LG,grad,gamma)
    L_sparse = LG - gamma*grad;
    %make the diagonal of L_sparse to be 0
    L_sparse(logical(eye(size(L_sparse)))) = 0;
    %we need to do projection
    L_sparse(L_sparse>0) = 0;
    %complete the L_sparse as a graph Laplacian
    L_sparse = L_sparse - diag(sum(L_sparse,1));    
end