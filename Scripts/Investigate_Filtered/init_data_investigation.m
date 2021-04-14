%% Init investigation
clear

%% add paths
load_paths;

%% Fetch data
load('..\..\Data\Filtered_Data\Training\Filtered_data.mat');

%% Number of signals
num_signals = length(SIGNALS)

%% List fieldnames of the signals
filed_names = fieldnames(SIGNALS{1})


%% Ivestigate fileds
%% Investigate field: 'Fs'
signal_Fs = cellfun(@(S) S.Fs, SIGNALS)
% All are scalers with value 250. Frames per second?

%% Investigate field: 'targetsRR'
signals_targetsRRS = struct;
signals_targetsRR.sizes = cellfun(@(S) size(S.targetsRR),SIGNALS,...
                                   'UniformOutput',false); 
    
signals_targetsRR.type = cellfun(@(S) class(S.targetsRR),SIGNALS,...
                                   'UniformOutput',false);
    
signals_targetsRR
% Realizations
figure
for i = 1:length(SIGNALS)
    subplot(2,2,i);
    plot(SIGNALS{i}.targetsRR);
    title(strcat('Targets RR signals: ', string(i)));
    xlabel('beat period');
end
% Analysis
% The signals are of different length but all are of the order 1e4.
% The signal is binary with 1 for AF period and 0 for normal.
% The signals have a different number of AF-periods with the first signal
%   having the fewest and the last signal having the most.
% Have 1 fewer value then targetsQRS.
% targetsRR and targetsQRS are identicall (if removing the last value)

%% Investigate field: 'rr'
signals_rr = struct;
signals_rr.sizes = cellfun(@(S) size(S.rr),SIGNALS,...
                                   'UniformOutput',false); 
    
signals_rr.type = cellfun(@(S) class(S.rr),SIGNALS,...
                                   'UniformOutput',false);
    
signals_rr
% Realizations
figure
for i = 1:length(SIGNALS)
    subplot(2,2,i);
    plot(SIGNALS{i}.rr);
    title(strcat('rr signals: ', string(i)));
    xlabel('Beat period');
    ylabel('Period duration');
end
% Analysis
% Signal is a column vector.
% The signals are of different length but all are of the order 1e4.
% Same number of elements as targetRR
% Values of order 1e0, never negative.
% Values looks like some sort of stochastic process... 

%% Epoch 
s = SIGNALS{2};
[s.es ;
s.ed;
s.ec]


