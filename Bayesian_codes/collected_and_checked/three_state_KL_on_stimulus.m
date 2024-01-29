function [out]=three_state_KL_on_stimulus(string,w)
%the string must be a column vector so that each of its elements is 1 or 2 or 3
%the output is a probability vector
%w is forgetting factor
N=zeros(3);
p=zeros(3,size(string,1));
p(1,1) = 1/3;
p(2,1) = 1/3;
p(3,1) = 1/3;
for i=2:size(string,1) % My change i form 2 to 1
    N=exp(-1/w)*N;
    N(string(i-1),string(i))=N(string(i-1),string(i))+1;
    % Calculation of integral P(S_1:i|\theta) which is the dominator in
    % P(\theta|S_1:t)
    fun1=@(x,y) (x.^N(1,3)).*(y.^N(1,2)).*((1-x-y).^N(1,1));
    fun2=@(x,y) (y.^N(2,3)).*(x.^N(2,1)).*((1-x-y).^N(2,2));
    fun3=@(x,y) (y.^N(3,1)).*(x.^N(3,2)).*((1-x-y).^N(3,3));
    ymax = @(x) 1 - x;
    denominator=integral2(fun1,0,1,0,ymax).*integral2(fun2,0,1,0,ymax).*integral2(fun3,0,1,0,ymax);
    for j=1:3
        tr=[string(i),j];% My change i-1 -> i
        p(j,i)=func(N,tr)./denominator;
    end
    out(i,1)=(p(1,i-1)*log(p(1,i-1)/p(1,i))+p(2,i-1)*log(p(2,i-1)/p(2,i))+p(3,i-1)*log(p(3,i-1)/p(3,i)));
end
out(1,1)=0;


