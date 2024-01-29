File collected_index_stimulus:
variable name: "collected_index_stimulus" for loading step
Description:
It is a cell array with dimention 75*1
It includes the index of stimulus restored in the cavanagh dataset. 
As it can be seen each cell is 1d array of different dimention which is corrospondingly related to each subject.
The order of subject in the array is based on the order of subject in the "participant.txt"

File reconstructed_stimulus
variable name: "reconstructed_stimulus_sequences"
Description:
It is a cell array with dimention 75*1
It includes all the reconstructed index stimulus
The order of subject in the array is based on the order of subject in the "participant.txt"

File Latencies
variable name: "Latencies"
Description
It is a cell array with dimention 75*1
It includes all the stimulus time intervals for all the subject. in each cell we have a 1d array of the dimention which is equal with
number of stimuli minus one.
The order of subject in the array is based on the order of subject in the "participant.txt".

File index_should_be_removed_corrected
variable name: 'I2'
Description:
It is a cell array with dimention 75*1
It includes all the index of complete surprise sequences, surprise calculated on reconstructed stimulus sequences, which should be removed 
for relating the surprise to any brain features.
The order of subject in the array is based on the order of subject in the "participant.txt"
Creation approach:
i is not equal with 12,22,60:
[B,t] = sort(Latencies{i},'descend');
t = t(2:1+200-size(Latencies{i},2)-1);, % t is the index which seems they are not reported in cavanagh dataset 
I2{i} = sort(t)+[0:size(t,2)-1]+1;
i = 12,22,60
[B,t] = sort(Latencies{i},'descend');
t = t(2:1+200-size(Latencies{i},2)-1-1);% t is the index which seems they are not reported in cavanagh dataset
t = [t(1),t];
t = sort(t);
I2{i} = t + [0:size(t,2)-1]+1;  
i = 12,22,60 are the subject index which has two consequtive removed stimulus