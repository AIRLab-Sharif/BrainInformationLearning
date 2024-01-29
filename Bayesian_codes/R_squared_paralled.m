function R_squared_paralled(u)
a=T{:,2};
b=T{:,3};
c=T{:,6};
d=T{:,7};

Path = {'D:\Mastersharif\MasterProject\data\parkinsons-oddball'};
Path_to_save_feature = 'D:\Mastersharif\MasterProject\data\parkinsons-oddball\EEG_feature\IC_collected_trials';
file_name = T{:,6};
newA = cellfun(@(x) strsplit(x, '.'), file_name, 'UniformOutput', false);
file_name = cellfun(@(x) x{1}, newA, 'UniformOutput', false);
% % High_pass = 38;
% % 
% % dir_name = ['EEGlab_pre_process_filtered_highpass_', num2str(High_pass)];
m_1 =0.0001;
m_2 =100;
T{:,7} = cellfun(@(x) [x(1:end-4),'_range_w_', num2str(m_1), '_', num2str(m_2),'_stored_b_final.mat'], T{:,7}, 'UniformOutput', false);
% T{:,12} = cellfun(@(x) [x(1:end-4),'_range_w_', num2str(m_1), '_', num2str(m_2),'.mat'], T{:,12}, 'UniformOutput', false);
dir_name = 'EEGlab_pre_process_'

Path_to_save_digit = 'D:\Mastersharif\MasterProject\data\parkinsons-oddball\EEG_feature\digit_sequences';
file_name1 = T{:,3};
newA = cellfun(@(x) strsplit(x, '.'), file_name1, 'UniformOutput', false);
file_name1 = cellfun(@(x) x{1}, newA, 'UniformOutput', false);
Path_to_save_digit = fullfile(Path_to_save_digit,file_name1);



dir_name = 'EEGlab_pre_process_';

result_file_feature_dir = fullfile(Path_to_save_feature,dir_name,file_name);
% digit_sequences_file_dir = fullfile(Path_to_save_feature,dir_name,file_name);
% main_stimuli_name = {'S200','S201','S202'};
% task_not_completed = selected_index_bad_lambda_v1
parfor (k=1:size(task_not_completed, 2),u)  
     i = task_not_completed(k);
%     load_path = fullfile(Path, a{i}); %sprintf('%s/%s',Path,a{i});
% %     EEG = pop_loadset(b{i},load_path);
% %     
% %     a1 = find(strcmp({EEG(1).event(1:end).type},main_stimuli_name{1})==1,1);
% %     b1 = find(strcmp({EEG(1).event(1:end).type},main_stimuli_name{2})==1,1);
% %     c1 = find(strcmp({EEG(1).event(1:end).type},main_stimuli_name{3})==1,1);
% %     first_stimulus = min([a1,b1,c1]);
% %     
% %     
% %     str_sequences = {EEG.event(first_stimulus:end).type};
% %     num_stimulus = size(str_sequences,2);
% %     digits_sequence = zeros(num_stimulus,1); 
% %     index = find(strcmp(str_sequences,main_stimuli_name{1})==1);
% %     digits_sequence(index) = 1;
% %     index = find(strcmp(str_sequences,main_stimuli_name{2})==1);
% %     digits_sequence(index) = 2;
% %     index = find(strcmp(str_sequences,main_stimuli_name{3})==1);
% %     digits_sequence(index) = 3;
%     
    digits_sequence = load(fullfile(Path_to_save_digit{i},'digit_sequences.mat'))
    digits_sequence = digits_sequence.Variable_name
    permutation = 1:size(digits_sequence,1);
    Final_Feature_Output = load(fullfile(result_file_feature_dir{i},c{i}))
    Final_Feature_Output = Final_Feature_Output.Variable_name;
    [B_final,B0,R_max,lasso_min_mse,m_optiaml,lambda_min_mse] = lasso_regression(Final_Feature_Output,digits_sequence,0.0001,100,100,0.01,100,1000,0.1,3,permutation);
    Y=BF_sur(digits_sequence,0.1,m_optiaml,3);
    Y=Y(permutation);
    fits = B0 + Final_Feature_Output*B_final;
    mse = mean((Y-fits).^2);
    R = 1 - mse/var(Y)
    Final_set = {R,R_max,m_optiaml,lambda_min_mse,B_final};
    
    wrapper_save(fullfile(result_file_feature_dir{i},d{i}),Final_set)
end
end