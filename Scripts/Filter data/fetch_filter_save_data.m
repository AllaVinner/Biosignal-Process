%% fetch, filter and save data
clear
addpath('..\lib');
%% Fetch data
file_path = '..\..\Data\AF_RR_intervals\Training\*.mat';
SIGNALS = fetch_data(file_path);

%% Filter SIGNALS
%% take away un important fields.
fileds2remove = {'targetsQRS' ;...
                 'qrs';...
                 'afBounds'};
for field = fileds2remove   
    SIGNALS = cellfun(@(s) rmfield(s,field), SIGNALS,...
                                    'UniformOutput',false);
end

%% Add appropriate fields
%% add epoch information
num_sig = length(SIGNALS);
for i = 1:num_sig
   s = SIGNALS{i};
   [epoch_start, epoch_duration, epoch_class] = signal2epoch(s.targetsRR);
   s.es = epoch_start;
   s.ed = epoch_duration;
   s.ec = epoch_class;
   SIGNALS{i} = s;
end

%% Save data
save_path = '..\..\Data\Filtered_Data\Training\';
name = 'Filtered_data.mat';
save(strcat(save_path, name), 'SIGNALS');

