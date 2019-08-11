function [Pro_Matrix,Mean_Image]=my_pca(Train_SET,Eigen_NUM)
%Input��
%Train_SET��training data matrix, each column is a training sample, Dim*Train_Num
%Eigen_NUM��the reduced dimension

%Output��
%Pro_Matrix��principal component matrix
%Mean_Image��mean image

[Dim,Train_Num]=size(Train_SET);

if Dim<=Train_Num
    Mean_Image=mean(Train_SET,2);
    Train_SET=bsxfun(@minus,Train_SET,Mean_Image);
    R=Train_SET*Train_SET'/(Train_Num-1);
    
    [eig_vec,eig_val]=eig(R);
    eig_val=diag(eig_val);
    [~,ind]=sort(eig_val,'descend');
    W=eig_vec(:,ind);
    Pro_Matrix=W(:,1:Eigen_NUM);
    
else
    Mean_Image=mean(Train_SET,2);
    Train_SET=bsxfun(@minus,Train_SET,Mean_Image);
    R=Train_SET'*Train_SET/(Train_Num-1);
    
    [eig_vec,eig_val]=eig(R);
    eig_val=diag(eig_val);
    [val,ind]=sort(eig_val,'descend');
    W=eig_vec(:,ind);
    Pro_Matrix=Train_SET*W(:,1:Eigen_NUM)*diag(val(1:Eigen_NUM).^(-1/2));
end
Pro_Matrix = real(Pro_Matrix);
end
