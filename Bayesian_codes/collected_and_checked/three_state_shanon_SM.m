function [surprise]=three_state_shanon_SM(string,w,n)
% string=string';
surprise=zeros(size(string,1),1);
c=zeros(n);
surprise(1) = log(3)/log(2);
epsilon = 1;
for i=2:size(string,1)
    p=(epsilon+c(string(i-1),string(i)))/(n*epsilon+sum(c(string(i-1),:)));  
    surprise(i) = -log(p)/log(2);   
    c=exp(-1/w)*c;
    c(string(i-1),string(i))=c(string(i-1),string(i))+1;
end
