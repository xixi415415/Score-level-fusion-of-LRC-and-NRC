function residual=nonRC(X,trls,y)
ClassNum = length(unique(trls));
[~,c] = NRC(X, y);
train_tol = length(trls);
%����sparse���󣬴�СΪtrain_tol*ClassNum�������length(x)������ֵ
W = sparse([],[],[],train_tol,ClassNum,length(c));

%�õ�ÿ���Ӧ��ϵ��
for j=1:ClassNum
    ind = (j==trls);
    W(ind,j) = c(ind);
end

%�������������ÿ���ع�����֮��Ĳв�
temp = X*W-repmat(y,1,ClassNum);
residual = sqrt(sum(temp.^2));

res_max=max(residual);
res_min=min(residual);
residual=(residual-res_min)/(res_max-res_min);
% %�Ѳ�������������С�в��Ӧ�������
% [~,index]=min(residual);

end