%% Investigate signals 
% Investigates the training signals by looking at the structs and the
% realizations to just get a feeling for the data.

clear
%% Fetch data (Might be necesary)
fetch_data

%% Load data (Necesary to run the rest)
load 'SIGNALS.mat'

%% Number of signals
num_signals = length(SIGNALS)

%% List fieldnames of the signals
filed_names = fieldnames(SIGNALS{1})

%% Ivestigate fileds
%% Investigate field: 'Fs'
signal_Fs = cellfun(@(S) S.Fs, SIGNALS)
% All are scalers with value 250. Frames per second?

%% Investigate field: 'recordName'
signal_recordName = cellfun(@(S)S.recordName,SIGNALS,...
                            'UniformOutput',false)
% Strings with and index of the recording.

%% Investigate field: 'targetsQRS'
signals_targetsQRS = struct;
signals_targetsQRS.sizes = cellfun(@(S) size(S.targetsQRS),SIGNALS,...
                                   'UniformOutput',false); 
    
signals_targetsQRS.type = cellfun(@(S) class(S.targetsQRS),SIGNALS,...
                                   'UniformOutput',false);
    
signals_targetsQRS
% Realizations
figure
for i = 1:length(SIGNALS)
    subplot(2,2,i);
    plot(SIGNALS{i}.targetsQRS);
    title(strcat('Targets QRS signals: ', string(i)));
end
% Analysis
% The signals are of different length but all are of the order 1e4.
% The signal is binary with 1 for AF period and 0 for normal.
% The signals have a different number of AF-periods with the first signal
%   having the fewest and the last signal having the most.

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
end
% Analysis
% The signals are of different length but all are of the order 1e4.
% The signal is binary with 1 for AF period and 0 for normal.
% The signals have a different number of AF-periods with the first signal
%   having the fewest and the last signal having the most.
% Have 1 fewer value then targetsQRS.
% targetsRR and targetsQRS are identicall (if removing the last value)

%% Investigate field: 'qrs'
signals_qrs = struct;
signals_qrs.sizes = cellfun(@(S) size(S.qrs),SIGNALS,...
                                   'UniformOutput',false); 
    
signals_qrs.type = cellfun(@(S) class(S.qrs),SIGNALS,...
                                   'UniformOutput',false);
    
signals_qrs
% Realizations
figure
for i = 1:length(SIGNALS)
    subplot(2,2,i);
    plot(SIGNALS{i}.qrs);
    title(strcat('qrs signals: ', string(i)));
end
% Analysis
% Signal is a column vector.
% The signals are of different length but all are of the order 1e4.
% Same number of elements as targetsQRS
% Values linearly increasing with a slope of [229 169 203 145]
% Values reaches order of 1e6 = 1e4*1e2

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
end
% Analysis
% Signal is a column vector.
% The signals are of different length but all are of the order 1e4.
% Same number of elements as targetRR
% Values of order 1e0, never negative.
% Values looks like some sort of stochastic process... 
    
%% Investigate field: 'afBounds'
signal_afBounds = struct;
signal_afBounds.size = cellfun(@(S)size(S.afBounds),SIGNALS,...
                            'UniformOutput',false);


signal_afBounds

signal_afBoundEx1 = SIGNALS{1}.afBounds
signal_afBoundEx2 = SIGNALS{2}.afBounds
signal_afBoundEx3 = SIGNALS{3}.afBounds
%signal_afBoundEx4 = SIGNALS{4}.afBounds
% Analysis
% Do not realy get this one.
% First row seems to be indeces or timepoints
% Second row is binary.

