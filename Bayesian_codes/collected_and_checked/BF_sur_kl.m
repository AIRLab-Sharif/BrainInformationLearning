function [out,p]=BF_sur_kl(string,epsilon,m,n)
% string=string';
surprise=zeros(size(string,1),1);
c=zeros(n);
% surprise(1) = log(3)/log(2);
p=zeros(n,size(string,1));
p(:,1)=1/3;
for i=2:size(string,1)
    for j=1:n
    p(j,i)=(epsilon+c(string(i-1),j))/(n*epsilon+sum(c(string(i-1),:)));
    end
    surprise(i) = -log(p(string(i),i)/log(2));
    temp = 1/(n*p(string(i),i));
    gamma=m*temp/(1+m*temp);
    delta=zeros(n);
    delta(string(i-1),string(i))=1;
    c(string(i-1),:)=(1-gamma)*c(string(i-1),:);
    c=c+delta;
    out(i)=p(1,i-1)*log(p(1,i-1)/p(1,i))+p(2,i-1)*log(p(2,i-1)/p(2,i))+p(3,i-1)*log(p(3,i-1)/p(3,i));
end
