%% calculate the flow rate
function LQ = graphLQ(new_P,LG)

LG = LG - diag(diag(LG));
dim = size(LG,1);
LQ = zeros(dim,dim);
for i = 1:1:dim
    for j = 1:1:dim
        if LG(i,j) ~= 0
            LQ(i,j) = (new_P(i,1)-new_P(j,1))*abs(LG(i,j)); %new_P is a colum which contains every node pressure
        end
    end
end

dia = diag(diag(LQ));
LQ = triu(LQ,1);
LQ = LQ'+LQ+dia;

end