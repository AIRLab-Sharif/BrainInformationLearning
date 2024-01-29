function [out]=core(N,tr,w)
fun1=@(x,y) (y.^N(1,3)).*(x.^N(1,2)).*((1-x-y).^N(1,1));
fun2=@(x,y) (y.^N(2,3)).*(x.^N(2,1)).*((1-x-y).^N(2,2));
fun3=@(x,y) (y.^N(3,1)).*(x.^N(3,2)).*((1-x-y).^N(3,3));
N2=(1-exp(-1/w))*N;
N2(tr(1),tr(2))=N2(tr(1),tr(2))-1;
logfun1=@(x,y) (y.^N(1,3)).*(x.^N(1,2)).*((1-x-y).^N(1,1)).*log((y.^N2(1,3)).*(x.^N2(1,2)).*((1-x-y).^N2(1,1)));
logfun2=@(x,y) (y.^N(2,3)).*(x.^N(2,1)).*((1-x-y).^N(2,2)).*log((y.^N2(2,3)).*(x.^N2(2,1)).*((1-x-y).^N2(2,2)));
logfun3=@(x,y) (y.^N(3,1)).*(x.^N(3,2)).*((1-x-y).^N(3,3)).*log((y.^N2(3,1)).*(x.^N2(3,2)).*((1-x-y).^N2(3,3)));
ymax = @(x) 1 - x;
 
o1=integral2(logfun1,0,1,0,ymax).*integral2(fun2,0,1,0,ymax).*integral2(fun3,0,1,0,ymax);
o2=integral2(fun1,0,1,0,ymax).*integral2(logfun2,0,1,0,ymax).*integral2(fun3,0,1,0,ymax);
o3=integral2(fun1,0,1,0,ymax).*integral2(fun2,0,1,0,ymax).*integral2(logfun3,0,1,0,ymax);
out=o1+o2+o3;
end
