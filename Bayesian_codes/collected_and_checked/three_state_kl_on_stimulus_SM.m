function [out]=three_state_kl_on_stimulus_SM(string,w,n)
%the string must be a column vector so that each of its elements is 1 or 2 or 3
%the output is a probability vector
%w is forgetting factor
% string=string';
c=zeros(n);
p=zeros(n,size(string,1));
out = zeros(size(string,1),1);
p(1,1) = 1/3;
p(2,1) = 1/3;
p(3,1) = 1/3;
epsilon = 1;
for i=2:size(string,1)
    % update Model
    c=exp(-1/w)*c;
    c(string(i-1),string(i))=c(string(i-1),string(i))+1;
    % Calculate P(Next_State|Consider Current State which has been seen
    % recently
    for j=1:n
        p(j,i) = (epsilon+c(string(i),j))/(n*epsilon+sum(c(string(i),:)));
    end
    % Calculate KL
    out(i,1)=(p(1,i-1)*log(p(1,i-1)/p(1,i))+p(2,i-1)*log(p(2,i-1)/p(2,i))+p(3,i-1)*log(p(3,i-1)/p(3,i)));
end
out(1,1)=0;


