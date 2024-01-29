import pandas as pd
import numpy as np
import os
import sys


linux_path = '/mnt/D/Mastersharif/MasterProject/data/parkinsons-oddball'
# file_name = os.path.join('D:\Mastersharif\MasterProject\data\parkinsons-oddball', 'participants.tsv')
file_name = os.path.join(linux_path, 'participants.tsv')
df_participants = pd.read_csv(file_name, delimiter='\t')

path_datasets = ''
all_number_task = 75
# tasks = {'local_file_path': np.array([]),
#         'raw_data_file_name':np.array([]),
#         'preprocessed_one':np.array([]),'flag1':np.zeros(all_number_task,),
#         'ERP_mat_file':np.array([]),'flag2':np.zeros(all_number_task,),
#         'PAC_dist':np.array([]),'flag3':np.zeros(all_number_task,),
#         'PAC_dist_mean_channel':np.array([]),'flag4':np.zeros(all_number_task,)}
tasks = {'local_file_path': np.array([]),
         'raw_data_file_name': np.array([]),
         'preprocessed_one': np.array([]),
         'ICA_name':np.array([]),
         'IC_Feature':np.array([]),
         'R_squareds_BF':np.array([]),
         'R_squareds_BF_permutation':np.array([]),
         'R_squareds_three_state':np.array([]),
         'R_squareds_three_state_permutation':np.array([]),
         'R_squareds_KL':np.array([]),
         'R_squareds_KL_permutation':np.array([]),
         'Group_file_type':np.array([])
         }

# # for row in df_participants.iterrows():
#     if row[1].Group == 'CTL':
#         file_path = os.path.join('', row[1].participant_id, 'ses-{0:0>2}'.format(1), 'eeg', '')
#         tasks['local_file_path'] = np.append(tasks['local_file_path'], file_path)

#         tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
#                                                 row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(1))

#         tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
#                                               'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
#                                                   1))

        
#         tasks['Group_file_type'] = np.append(tasks['Group_file_type'], row[1].Group)

#         tasks['ICA_name'] = np.append(tasks['ICA_name'],
#                                               'ICA_pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
#                                                   1))
    
#         tasks['IC_Feature'] = np.append(tasks['IC_Feature'],
#                                               'IC_Feature_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
#                                                   1))
#         tasks['R_squareds_BF'] = np.append(tasks['R_squareds_BF'],
#                                               'R_squareds_BF_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
#                                                   1))      

#         tasks['R_squareds_BF_permutation'] = np.append(tasks['R_squareds_BF_permutation'],
#                                               'R_squareds_permutation_BF_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
#                                                   1))                                                                               
#         tasks['R_squareds_three_state'] = np.append(tasks['R_squareds_three_state'],
#                                               'R_squareds_three_state_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
#                                                   1))
        
#         tasks['R_squareds_three_state_permutation'] = np.append(tasks['R_squareds_three_state_permutation'],
#                                               'R_squareds_three_state_permutation_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
#                                                   1))                                          
        
#         tasks['R_squareds_KL'] = np.append(tasks['R_squareds_KL'],
#                                               'R_squareds_KL_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
#                                                   1))
        
#         tasks['R_squareds_KL_permutation'] = np.append(tasks['R_squareds_KL_permutation'],
#                                               'R_squareds_KL_permutation_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
#                                                   1)) 


#         # file_path = os.path.join('', row[1].participant_id, 'ses-{0:0>2}'.format(1), 'eeg', '')
#         # tasks['local_file_path'] = np.append(tasks['local_file_path'], file_path)
#         # file_path = os.path.join('', row[1].participant_id, 'ses-{0:0>2}'.format(2), 'eeg', '')
#         # tasks['local_file_path'] = np.append(tasks['local_file_path'], file_path)
#         #
#         # tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
#         #                                         row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(1))
#         # tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
#         #                                         row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(2))
#         #
#         # tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
#         #                                       'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
#         #                                           1))
#         # tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
#         #                                       'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
#         #                                           2))
#         #


#         # tasks['ERP_mat_file'] = np.append(tasks['ERP_mat_file'], 'ERP_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         # tasks['ERP_mat_file'] = np.append(tasks['ERP_mat_file'], 'ERP_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))
#         #
#         # tasks['ERP_npy_file'] = np.append(tasks['ERP_npy_file'], 'ERP_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(1))
#         # tasks['ERP_npy_file'] = np.append(tasks['ERP_npy_file'], 'ERP_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(2))
#         #
#         # # tasks['PAC_sequences'] = np.append(tasks['PAC_sequences'],'PAC_sequences_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         # # tasks['PAC_sequences'] = np.append(tasks['PAC_sequences'],'PAC_sequences_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))
#         #
#         # tasks['ERP_nobaseline_npy_file'] = np.append(tasks['ERP_nobaseline_npy_file'], 'ERP_nb_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(1))
#         # tasks['ERP_nobaseline_npy_file'] = np.append(tasks['ERP_nobaseline_npy_file'], 'ERP_nb_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(2))
#         #
#         # tasks['PAC_sequences_v1'] = np.append(tasks['PAC_sequences_v1'], 'PAC_sequences_v1' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         # tasks['PAC_sequences_v1'] = np.append(tasks['PAC_sequences_v1'], 'PAC_sequences_v1' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))

#         # tasks['PAC_dist_mean_channel'] = np.append(tasks['PAC_dist_mean_channel'],'PAC_mean_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         # tasks['PAC_dist_mean_channel'] = np.append(tasks['PAC_dist_mean_channel'],'PAC_mean_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))

#         # tasks['Rank_Stage'] = np.append(tasks['Rank_Stage'], 'Rank_stages_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         # tasks['Rank_Stage'] = np.append(tasks['Rank_Stage'], 'Rank_stages_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))

#         # tasks['Group_file_type'] = np.append(tasks['Group_file_type'], row[1].Group + '_' + row[1].sess1_Med)


#     # else:
#     #     file_path = os.path.join('', row[1].participant_id, 'ses-{0:0>2}'.format(1), 'eeg', '')
#     #     tasks['local_file_path'] = np.append(tasks['local_file_path'], file_path)

#     #     tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
#     #                                             row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(1))

#     #     tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
#     #                                           'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
#     #                                               1))

#         # tasks['ERP_mat_file'] = np.append(tasks['ERP_mat_file'], 'ERP_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         #
#         # tasks['ERP_npy_file'] = np.append(tasks['ERP_npy_file'], 'ERP_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(1))
#         #
#         # tasks['ERP_nobaseline_npy_file'] = np.append(tasks['ERP_nobaseline_npy_file'], 'ERP_nb_correct_' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(1))
#         #
#         # tasks['PAC_sequences_v1'] = np.append(tasks['PAC_sequences_v1'], 'PAC_sequence_v1' + row[
#         #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         #
#         # # tasks['PAC_dist_mean_channel'] = np.append(tasks['PAC_dist_mean_channel'],'PAC_mean_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         #
#         # # tasks['Rank_Stage'] = np.append(tasks['Rank_Stage'], 'Rank_stages_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
#         #
#         # tasks['Group_file_type'] = np.append(tasks['Group_file_type'], row[1].Group)

# task_df = pd.DataFrame(tasks)
# # task_df.to_csv('task_track_file.csv')
# task_df.to_csv('.\\Task_track_files\\task_track_file_v3.csv')

for row in df_participants.iterrows():
    if row[1].Group == 'PD':
        file_path = os.path.join('', row[1].participant_id, 'ses-{0:0>2}'.format(1), 'eeg', '')
        tasks['local_file_path'] = np.append(tasks['local_file_path'], file_path)
        file_path = os.path.join('',row[1].participant_id,'ses-{0:0>2}'.format(2),'eeg','')
        tasks['local_file_path'] = np.append(tasks['local_file_path'],file_path) 
        
        tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
                                                row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(1))
        tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
                                                row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(2))
        
        tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
                                              'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
                                                  1))
        tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
                                              'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
                                                  2))

        
        tasks['Group_file_type'] = np.append(tasks['Group_file_type'], row[1].Group + '_' +row[1].sess1_Med)
        tasks['Group_file_type'] = np.append(tasks['Group_file_type'], row[1].Group + '_' +row[1].sess2_Med)

        tasks['ICA_name'] = np.append(tasks['ICA_name'],
                                              'ICA_pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
                                                  1))
        tasks['ICA_name'] = np.append(tasks['ICA_name'],
                                              'ICA_pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
                                                  2))
            
        tasks['IC_Feature'] = np.append(tasks['IC_Feature'],
                                              'IC_Feature_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  1))
        tasks['IC_Feature'] = np.append(tasks['IC_Feature'],
                                              'IC_Feature_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  2))
        
        tasks['R_squareds_BF'] = np.append(tasks['R_squareds_BF'],
                                              'R_squareds_BF_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  1))      
        tasks['R_squareds_BF'] = np.append(tasks['R_squareds_BF'],
                                              'R_squareds_BF_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  2))  

        tasks['R_squareds_BF_permutation'] = np.append(tasks['R_squareds_BF_permutation'],
                                              'R_squareds_permutation_BF_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  1))                                                                               
        tasks['R_squareds_BF_permutation'] = np.append(tasks['R_squareds_BF_permutation'],
                                              'R_squareds_permutation_BF_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  2))   


        
        tasks['R_squareds_three_state'] = np.append(tasks['R_squareds_three_state'],
                                              'R_squareds_three_state_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  1))
        tasks['R_squareds_three_state'] = np.append(tasks['R_squareds_three_state'],
                                              'R_squareds_three_state_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  2))

        
        tasks['R_squareds_three_state_permutation'] = np.append(tasks['R_squareds_three_state_permutation'],
                                              'R_squareds_three_state_permutation_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  1))  
        tasks['R_squareds_three_state_permutation'] = np.append(tasks['R_squareds_three_state_permutation'],
                                              'R_squareds_three_state_permutation_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  2)) 

        
        tasks['R_squareds_KL'] = np.append(tasks['R_squareds_KL'],
                                              'R_squareds_KL_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  1))
        tasks['R_squareds_KL'] = np.append(tasks['R_squareds_KL'],
                                              'R_squareds_KL_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  2)) 


        
        tasks['R_squareds_KL_permutation'] = np.append(tasks['R_squareds_KL_permutation'],
                                              'R_squareds_KL_permutation_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  1))
        tasks['R_squareds_KL_permutation'] = np.append(tasks['R_squareds_KL_permutation'],
                                              'R_squareds_KL_permutation_v3_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(
                                                  2))                                            
task_df = pd.DataFrame(tasks)
# task_df.to_csv('task_track_file.csv') 
if sys.platform == 'linux':
    task_df.to_csv('.//Task_track_files//task_track_file_v3_PD_linux.csv')
else:
    task_df.to_csv('.\\Task_track_files\\task_track_file_v3_PD.csv')    

        # file_path = os.path.join('', row[1].participant_id, 'ses-{0:0>2}'.format(1), 'eeg', '')
        # tasks['local_file_path'] = np.append(tasks['local_file_path'], file_path)
        # file_path = os.path.join('', row[1].participant_id, 'ses-{0:0>2}'.format(2), 'eeg', '')
        # tasks['local_file_path'] = np.append(tasks['local_file_path'], file_path)
        #
        # tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
        #                                         row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(1))
        # tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
        #                                         row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(2))
        #
        # tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
        #                                       'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
        #                                           1))
        # tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
        #                                       'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
        #                                           2))
        #


        # tasks['ERP_mat_file'] = np.append(tasks['ERP_mat_file'], 'ERP_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        # tasks['ERP_mat_file'] = np.append(tasks['ERP_mat_file'], 'ERP_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))
        #
        # tasks['ERP_npy_file'] = np.append(tasks['ERP_npy_file'], 'ERP_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(1))
        # tasks['ERP_npy_file'] = np.append(tasks['ERP_npy_file'], 'ERP_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(2))
        #
        # # tasks['PAC_sequences'] = np.append(tasks['PAC_sequences'],'PAC_sequences_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        # # tasks['PAC_sequences'] = np.append(tasks['PAC_sequences'],'PAC_sequences_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))
        #
        # tasks['ERP_nobaseline_npy_file'] = np.append(tasks['ERP_nobaseline_npy_file'], 'ERP_nb_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(1))
        # tasks['ERP_nobaseline_npy_file'] = np.append(tasks['ERP_nobaseline_npy_file'], 'ERP_nb_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(2))
        #
        # tasks['PAC_sequences_v1'] = np.append(tasks['PAC_sequences_v1'], 'PAC_sequences_v1' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        # tasks['PAC_sequences_v1'] = np.append(tasks['PAC_sequences_v1'], 'PAC_sequences_v1' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))

        # tasks['PAC_dist_mean_channel'] = np.append(tasks['PAC_dist_mean_channel'],'PAC_mean_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        # tasks['PAC_dist_mean_channel'] = np.append(tasks['PAC_dist_mean_channel'],'PAC_mean_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))

        # tasks['Rank_Stage'] = np.append(tasks['Rank_Stage'], 'Rank_stages_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        # tasks['Rank_Stage'] = np.append(tasks['Rank_Stage'], 'Rank_stages_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(2))

        # tasks['Group_file_type'] = np.append(tasks['Group_file_type'], row[1].Group + '_' + row[1].sess1_Med)


    # else:
    #     file_path = os.path.join('', row[1].participant_id, 'ses-{0:0>2}'.format(1), 'eeg', '')
    #     tasks['local_file_path'] = np.append(tasks['local_file_path'], file_path)

    #     tasks['raw_data_file_name'] = np.append(tasks['raw_data_file_name'],
    #                                             row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(1))

    #     tasks['preprocessed_one'] = np.append(tasks['preprocessed_one'],
    #                                           'pre_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.set'.format(
    #                                               1))

        # tasks['ERP_mat_file'] = np.append(tasks['ERP_mat_file'], 'ERP_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        #
        # tasks['ERP_npy_file'] = np.append(tasks['ERP_npy_file'], 'ERP_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(1))
        #
        # tasks['ERP_nobaseline_npy_file'] = np.append(tasks['ERP_nobaseline_npy_file'], 'ERP_nb_correct_' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.npy'.format(1))
        #
        # tasks['PAC_sequences_v1'] = np.append(tasks['PAC_sequences_v1'], 'PAC_sequence_v1' + row[
        #     1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        #
        # # tasks['PAC_dist_mean_channel'] = np.append(tasks['PAC_dist_mean_channel'],'PAC_mean_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        #
        # # tasks['Rank_Stage'] = np.append(tasks['Rank_Stage'], 'Rank_stages_' + row[1].participant_id + '_ses-{0:0>2}_task-Rest_eeg.mat'.format(1))
        #
        # tasks['Group_file_type'] = np.append(tasks['Group_file_type'], row[1].Group)


