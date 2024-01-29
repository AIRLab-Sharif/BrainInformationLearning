function [sur]=three_state_KL_on_params(string,w)
N=zeros(3);
sur=zeros(size(string,1),1);
for i=2:size(string,1)
    tr=[string(i-1),string(i)];
    % Calculation of core term, See the model2.pdf file in "kamyab codes" folder for more detail
    calculated_integral=core(N,tr,w);
    % Calculation of P(S_{1:i-1}|\theta)
    fun1=@(x,y) (y.^N(1,3)).*(x.^N(1,2)).*((1-x-y).^N(1,1));
    fun2=@(x,y) (y.^N(2,3)).*(x.^N(2,1)).*((1-x-y).^N(2,2));
    fun3=@(x,y) (y.^N(3,1)).*(x.^N(3,2)).*((1-x-y).^N(3,3));
    ymax = @(x) 1 - x;
    denominator1=integral2(fun1,0,1,0,ymax).*integral2(fun2,0,1,0,ymax).*integral2(fun3,0,1,0,ymax); 
    % Update model
    N=exp(-1/w)*N;
    N(string(i-1),string(i))=N(string(i-1),string(i))+1;
    % Calculation of P(S_{1:i}|\theta)
    fun1=@(x,y) (y.^N(1,3)).*(x.^N(1,2)).*((1-x-y).^N(1,1));
    fun2=@(x,y) (y.^N(2,3)).*(x.^N(2,1)).*((1-x-y).^N(2,2));
    fun3=@(x,y) (y.^N(3,1)).*(x.^N(3,2)).*((1-x-y).^N(3,3));
    ymax = @(x) 1 - x;
    denominator2=integral2(fun1,0,1,0,ymax).*integral2(fun2,0,1,0,ymax).*integral2(fun3,0,1,0,ymax);
    % See the findal relation for Y_t in model2.pdf
    sur(i)=calculated_integral/denominator1+log(denominator2/denominator1);
end
end