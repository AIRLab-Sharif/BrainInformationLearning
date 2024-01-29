function [sur]=three_state_KL_on_params_SM(string,w,n)
N=zeros(n);
sur=zeros(size(string,1),1);
for i=2:size(string,1)
    N_old = N;
    % Update model
    N=exp(-1/w)*N;
    N(string(i-1),string(i))=N(string(i-1),string(i))+1;
%     % Calculation of KL
%     alpha_old = N_old(string(i-1),:)+1;
%     alph = N(string(i-1),:)+1;
%     t1 = log(gamma(sum(alpha_old))/gamma(sum(alph)));
%     t2 = sum(log(gamma(alph)./gamma(alpha_old)));
%     temp = sum(alpha_old);
%     t3 = sum((N_old(string(i-1),:)-N(string(i-1),:)).*(psi(alpha_old)-psi(temp)));
%     sur(i)= t1 + t2 + t3;
     % Calculation of KL(P(\theta|S_{1:t-1})||P(\theta|S_{1:t}))
     temp_sum = 0;
     for k=1:n
        alpha_old = N_old(k,:) + 1;
        alpha_new = N(k,:)+1;
        
        t1 = log(gamma(sum(alpha_old))/gamma(sum(alpha_new)));
        t2 = sum(log(gamma(alpha_new)./gamma(alpha_old)));
        temp = sum(alpha_old);
        t3 = sum((alpha_old-alpha_new).*(psi(alpha_old)-psi(temp)));
        
        temp_sum = temp_sum + t1+t2+t3;
     end
    sur(i) = temp_sum;
end
end