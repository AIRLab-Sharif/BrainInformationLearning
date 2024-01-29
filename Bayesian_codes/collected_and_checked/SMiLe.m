function [out]=SMiLe(string,m,epsilon,iteration)
N=size(string,1);
out=zeros(1,N);
Belief=[1/3,1/3,1/3];% is a function of theta
P_hat=[1/3,1/3,1/3];% it is a function of theta
for n=1:N
    X=string(n);
%   This section is going to calculate P hat(theta), see section 4.1
%   equation 11
    if X==1
        P_hat(1)=1-epsilon;
        P_hat(2)=epsilon/2;
        P_hat(3)=epsilon/2;
    elseif X==2
        P_hat(2)=1-epsilon;
        P_hat(1)=epsilon/2;
        P_hat(3)=epsilon/2;
    elseif X==3
        P_hat(3)=1-epsilon;
        P_hat(1)=epsilon/2;
        P_hat(2)=epsilon/2;
    end
    S=Belief(1)*log(Belief(1)/P_hat(1))+Belief(2)*log(Belief(2)/P_hat(2))+Belief(3)*log(Belief(3)/P_hat(3));
    B_max=P_hat(1)*log(P_hat(1)/Belief(1))+P_hat(2)*log(P_hat(2)/Belief(2))+P_hat(3)*log(P_hat(3)/Belief(3));
    B=(m*S/(1+m*S))*B_max;
    q=[1/3,1/3,1/3];
    temp=inf;
    for i=1:(iteration-1)
        lambda=i/iteration;
        if X==1
            q(1)=((1-epsilon)^lambda)*(Belief(1)^(1-lambda));
            q(2)=((epsilon/2)^lambda)*(Belief(2)^(1-lambda));
            q(3)=((epsilon/2)^lambda)*(Belief(3)^(1-lambda));
        elseif X==2
            q(2)=((1-epsilon)^lambda)*(Belief(2)^(1-lambda));
            q(1)=((epsilon/2)^lambda)*(Belief(1)^(1-lambda));
            q(3)=((epsilon/2)^lambda)*(Belief(3)^(1-lambda));
        elseif X==3 
            q(3)=((1-epsilon)^lambda)*(Belief(3)^(1-lambda));
            q(1)=((epsilon/2)^lambda)*(Belief(1)^(1-lambda));
            q(2)=((epsilon/2)^lambda)*(Belief(2)^(1-lambda));
        end
        sum=q(1)+q(2)+q(3);
        q=q./sum;
        D_kl=q(1)*log(q(1)/Belief(1))+q(2)*log(q(2)/Belief(2))+q(3)*log(q(3)/Belief(3));
        if abs(D_kl-B)<temp
            Q=q;
            temp=abs(D_kl-B);
        end
    end
    Belief=Q;
    out(n)=S;
end
    
    
