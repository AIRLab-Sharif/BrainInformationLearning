function [sur]=Confidence_Corrected(string,w,n,m)
N=zeros(n);
sur=zeros(size(string,1),1);
sur_KL_parameter = zeros(size(string,1),1);
sur_Shanon = zeros(size(string,1),1);
Commitment = zeros(size(string,1),1);
sur(1) = log(n)/log(2);
epsilon = 1;
for i=2:size(string,1)
    % Calculation of core term, See the model2.pdf file in "kamyab codes" folder for more detail
    %%% Attention all where the alpha is used should be replaced 
    %%% with update rule of Confidence corrected 
    %%% Calculate the parameter of P(\theta|S_{t-1:t})
    N_new = zeros(1,n);
    N_new(1,string(i)) = 1;
    alpha = N_new + 1;
    %%% Calcualate directly KL(P(\theta|S_{1:t-1})||P(\theta|S_{t-1:t}))
    
%     N_old = N;
%     N_naive_bayse = N;
%     % Update model
%     %%% Naive Bayse Rule and Memory(w) update
%     N_naive_bayse=exp(-1/w)*N_naive_bayse;
%     N_naive_bayse(string(i-1),string(i))= N_naive_bayse(string(i-1),string(i))+1;
%     alph = N_naive_bayse(string(i-1),:)+1;
%     %%% KL(\pi_n||\pi^{Bayes rule}_{n+1})

    alpha_old = N(string(i-1),:)+1;
    t1 = log(gamma(sum(alpha_old))/gamma(sum(alpha)));
    t2 = sum(log(gamma(alpha)./gamma(alpha_old)));
    temp = sum(alpha_old);
    t3 = sum((alpha_old-alpha).*(psi(alpha_old)-psi(temp)));
    % See the findal relation for Y_t in model2.pdf
    % Surprise KL parameter 
%     sur_KL_parameter(i)= t1 + t2 + t3;
    sur(i) = t1 + t2 + t3; 
%     % shanon 
%     p=(epsilon+N_old(string(i-1),string(i)))/(n*epsilon+sum(N_old(string(i-1),:)));
%     sur_Shanon(i) = -log(p)/log(2);
%     % Commitment
%     %%% for is because the we have 3 direchleh distributions 
%     %%% in each loop, we calculate the entropy of one of them.
%     temp = 0;
%     for j=1:n
%         alpha = N(j,:) + 1;
%         alpha_0 = sum(alpha);
%         B_alpha = prod(gamma(alpha))/(sum(gamma(alpha)));
%         temp = temp + log(B_alpha)/log(2) + (alpha_0 - n)*psi(alpha_0) - sum((alpha-1).*psi(alpha)); 
%     end
%     Commitment(i) = -temp;
%     
%     % Calucalte the Confidence Corrected Surprise
%     sur(i) = sur_KL_parameter(i) + sur_Shanon(i) +  Commitment(i);  
%     % The Learning Step should be done Here:
    %%% Calculate B_max
    N_temp_uniform = zeros(1,3);
    N_temp_uniform(1,string(i)) = 1;
    alpha_old = N_temp_uniform(1,:)+1;
    alph = N(1,string(i))+1;
    
    t1 = log(gamma(sum(alpha_old))/gamma(sum(alph)));
    t2 = sum(log(gamma(alph)./gamma(alpha_old)));
    temp = sum(alpha_old);
    t3 = sum(( alpha_old - alpha).*(psi(alpha_old)-psi(temp)));
    % See the findal relation for Y_t in model2.pdf
    % Surprise KL parameter 
    B_max  = t1 + t2 + t3;
   
    %%% Calculate lambda to calculate update rule \pi_{n+1}(\theta)
    B = m*sur(i)/(1+m*sur(i)) * B_max;
    lambda_set = 0.01:0.001:1;
    lambda = 1;
    for lambda_temp = lambda_set
        %%% Calculate Q_\lambda
        N_temp = (1-lambda_temp)*N;
        N_temp(string(i-1),string(i)) = N_temp(string(i-1),string(i)) + lambda_temp*(N_temp(string(i-1),string(i))+1);
        %%% Calculate KL(Q_\lambda||Current_Belief)
        alph = N(string(i-1),:)+1;
        alpha_old = N_temp(string(i-1),:)+1;
        t1 = log(gamma(sum(alpha_old))/gamma(sum(alph)));
        t2 = sum(log(gamma(alph)./gamma(alpha_old)));
        temp = sum(alpha_old);
        t3 = sum((alpha_old-alph).*(psi(alpha_old)-psi(temp)));
        % See the findal relation for Y_t in model2.pdf
        % Surprise KL parameter 
        if abs(B-t1+t2+t3)<1.01
            lambda = lambda_temp;
            break;
        end    
    end    
    %%% Apply Update Rule Based On confiedence Corrected
    N = (1-lambda)*N; 
    N(string(i-1),string(i)) = N(string(i-1),string(i)) + lambda*(N(string(i-1),string(i))+1);
end
end