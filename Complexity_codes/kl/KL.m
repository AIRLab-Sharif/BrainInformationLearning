function [sur]=KL(string,w)
N=zeros(3);
sur=zeros(size(string,1),1);
for i=2:size(string,1)
    tr=[string(i-1),string(i)];
    calculated_integral=core(N,tr,w);
    fun1=@(x,y) (y.^N(1,3)).*(x.^N(1,2)).*((1-x-y).^N(1,1));
    fun2=@(x,y) (y.^N(2,3)).*(x.^N(2,1)).*((1-x-y).^N(2,2));
    fun3=@(x,y) (y.^N(3,1)).*(x.^N(3,2)).*((1-x-y).^N(3,3));
    ymax = @(x) 1 - x;
    denominator1=integral2(fun1,0,1,0,ymax).*integral2(fun2,0,1,0,ymax).*integral2(fun3,0,1,0,ymax); 
    
    N=exp(-1/w)*N;
    N(string(i-1),string(i))=N(string(i-1),string(i))+1;
    
    fun1=@(x,y) (y.^N(1,3)).*(x.^N(1,2)).*((1-x-y).^N(1,1));
    fun2=@(x,y) (y.^N(2,3)).*(x.^N(2,1)).*((1-x-y).^N(2,2));
    fun3=@(x,y) (y.^N(3,1)).*(x.^N(3,2)).*((1-x-y).^N(3,3));
    ymax = @(x) 1 - x;
    denominator2=integral2(fun1,0,1,0,ymax).*integral2(fun2,0,1,0,ymax).*integral2(fun3,0,1,0,ymax);
    
    sur(i)=calculated_integral/denominator1+log(denominator2/denominator1);
end
sur = 40*sur;
end