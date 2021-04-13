%% Init investigation

clear
%% add paths
load_paths;

%% Fetch data
load('..\..\Data\Seperated_Data\Training\Seperated_data.mat');

%% Number of signals
num_classes = length(CLASS)

%% List fieldnames of the signals
filed_names = fieldnames(CLASS{1})


%% Ivestigate fileds
%% Investigate field: 'data'
class_data = struct;
class_data.sizes = cellfun(@(C) size(C.data),CLASS,...
                                   'UniformOutput',false); 
   
class_data
class_data.sizes{:}
% Realizations
for ci = 1:length(CLASS)
    figure
    index = randperm(length(CLASS{ci}.data),9);
    for i = 1:9
        subplot(3,3,i);
        plot(CLASS{ci}.data{index(i)});
        xlabel('Beat');
        ylabel('time duration of beat');
        title(strcat('RR realization of class',string(ci-1)));
    end
end
% Analysis
%

%% Investigate field: 'timeDuration'
class_timeDuration = struct;
class_timeDuration.sizes = cellfun(@(C) size(C.timeDuration),CLASS,...
                                   'UniformOutput',false); 
    
class_timeDuration.sizes{:}
for ci = 1:length(CLASS)
    figure
    subplot(211);
    plot(CLASS{ci}.timeDuration);
    subplot(212);
    histogram(CLASS{ci}.timeDuration,100);
    
end

% Analysis

%% Investigate field: 'beatDuration'
class_beatDuration = struct;
class_beatDuration.sizes = cellfun(@(C) size(C.beatDuration),CLASS,...
                                   'UniformOutput',false); 
    
 
class_beatDuration.sizes{:}
for ci = 1:length(CLASS)
    figure
    subplot(211);
    plot(CLASS{ci}.beatDuration);
    subplot(212);
    histogram(CLASS{ci}.beatDuration,100);
    
end

% Analysis
