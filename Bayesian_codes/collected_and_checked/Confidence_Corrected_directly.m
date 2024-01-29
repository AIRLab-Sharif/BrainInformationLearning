function [sur]=Confidence_Corrected_directly(string,m,n)
N=zeros(n);
sur=zeros(size(string,1),1);
% sur_KL_parameter = zeros(size(string,1),1);
% sur_Shanon = zeros(size(string,1),1);
% Commitment = zeros(size(string,1),1);
% sur(1) = log(n)/log(2);
% epsilon = 1;
for i=2:size(string,1)
    % Calculation of core term, See the model2.pdf file in "kamyab codes" folder for more detail
    %%% Attention all where the alpha is used should be replaced 
    %%% with update rule of Confidence corrected 
    %%% Calcualate directly KL(P(\theta|S_{1:t-1})||P(\theta|S_{t-1:t}))
    temp_sum  = 0;
    N_new = zeros(n);
    N_new(string(i-1),string(i)) = 1;
    for k=1:n
        alpha_new = N_new(k,:) + 1;
        alpha_old = N(k,:)+1;
        
        t1 = log(gamma(sum(alpha_old))/gamma(sum(alpha_new)));
        t2 = sum(log(gamma(alpha_new)./gamma(alpha_old)));
        temp = sum(alpha_old);
        t3 = sum((alpha_old-alpha_new).*(psi(alpha_old)-psi(temp)));
        
        temp_sum = temp_sum + t1+t2+t3;
    end
    sur(i) = temp_sum;
    
    %%% Calculation of B_max
    temp_sum  = 0;
    N_new = zeros(n);
    N_new(string(i-1),string(i)) = 1;
    for k=1:n
        alpha_old = N_new(k,:) + 1;
        alpha_new = N(k,:)+1;
        
        t1 = log(gamma(sum(alpha_old))/gamma(sum(alpha_new)));
        t2 = sum(log(gamma(alpha_new)./gamma(alpha_old)));
        temp = sum(alpha_old);
        t3 = sum((alpha_old-alpha_new).*(psi(alpha_old)-psi(temp)));
        
        temp_sum = temp_sum + t1+t2+t3;
    end
    B_max = temp_sum;
    
%     N_temp_uniform = zeros(1,n);
%     N_temp_uniform(1,string(i)) = 1;
%     alpha_old = N_temp_uniform(1,:)+1;
%     alph = N(string(i-1),:)+1;
%     
%     t1 = log(gamma(sum(alpha_old))/gamma(sum(alph)));
%     t2 = sum(log(gamma(alph)./gamma(alpha_old)));
%     temp = sum(alpha_old);
%     t3 = sum(( alpha_old - alpha_new).*(psi(alpha_old)-psi(temp)));
%     % See the findal relation for Y_t in model2.pdf
%     % Surprise KL parameter 
   
    %%% Calculate lambda to calculate update rule \pi_{n+1}(\theta)
    B = m*sur(i)/(1+m*sur(i)) * B_max;
    lambda_set = 0.001:0.01:1;
    lambda = 1;
    Min_diff = inf;
    for lambda_temp = lambda_set
        %%% Calculate Q_\lambda
        N_temp = (1-lambda_temp)*N;
        N_temp(string(i-1),string(i)) = N_temp(string(i-1),string(i)) + lambda_temp;
        %%% Calculate KL(Q_\lambda||Current_Belief)
        temp_sum = 0;
        for k=1:n
            alph = N(k,:)+1;
            alpha_old = N_temp(k,:)+1;
            t1 = log(gamma(sum(alpha_old))/gamma(sum(alph)));
            t2 = sum(log(gamma(alph)./gamma(alpha_old)));
            temp = sum(alpha_old);
            t3 = sum((alpha_old-alph).*(psi(alpha_old)-psi(temp)));
            % See the findal relation for Y_t in model2.pdf
            % Surprise KL parameter
            temp_sum = temp_sum + t1+t2+t3;
        end    
        if abs(B-temp_sum)<Min_diff
            Min_diff = abs(B-temp_sum);
            lambda = lambda_temp;
        end    
    end    
    %%% Apply Update Rule Based On confiedence Corrected
    N = (1-lambda)*N; 
    N(string(i-1),string(i)) = N(string(i-1),string(i)) + lambda;
end
end