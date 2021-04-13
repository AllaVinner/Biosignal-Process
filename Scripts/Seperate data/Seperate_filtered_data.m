%% Seperate data
% This file takes the data from filered_data and seperates it from being
% patient based to beeing class based. As in two structs, one for class one
% and one for class zero.
% The structs should contain fields:
%
%         arrays of length: total number of class 1 epochs
%
%         data - cell array with the rr data from the period
%         duration of epoch (beats);
%         duration of epoch (time);
%         starting pulse beat of epoch
%         patient id 
%
% _____________________________________________________________________
clear
%% add paths
load_paths;

%% Fetch data
load('..\..\Data\Filtered_Data\Training\Filtered_data.mat');

%% Seperate and structure them 
num_sig = length(SIGNALS);
num_class = 2;
num_epo = zeros(num_class,1);
for i = 1:num_sig
   [GC,GR] = groupcounts(SIGNALS{i}.ec');
   num_epo = num_epo + GC;
end

%% Initiate CLASS
CLASS = cell(num_class,1);
for ec = 1:num_class
   e_i = num_epo(ec);
   CLASS{ec} = struct;
   CLASS{ec}.data = cell(1,e_i); 
   CLASS{ec}.timeDuration = zeros(1,e_i);
   CLASS{ec}.beatDuration = zeros(1,e_i);
   CLASS{ec}.startBeat = zeros(1,e_i);
   CLASS{ec}.patientID = zeros(1,e_i);   
end

%% Seperate data
ext_epo_i = zeros(num_class,1);
for signal_i = 1:num_sig
    s = SIGNALS{signal_i};
    for int_epo_i = 1:length(s.ec)
        ec = s.ec(int_epo_i);
        es = s.es(int_epo_i);
        ed = s.ed(int_epo_i);
        
        c_i = ec+1;
        ext_epo_i(c_i) = ext_epo_i(c_i) + 1;
        
        CLASS{c_i}.data{ext_epo_i(c_i)} = s.rr(es:es+ed-1);
        CLASS{c_i}.timeDuration(ext_epo_i(c_i)) = sum(s.rr(es:es+ed-1));
        CLASS{c_i}.beatDuration(ext_epo_i(c_i)) = ed;
        CLASS{c_i}.startBeat(ext_epo_i(c_i)) = es;
        CLASS{c_i}.patientID(ext_epo_i(c_i)) = signal_i;       
    end
end

%% SAVE seperation
save_path = '..\..\Data\Seperated_Data\Training\';
name = 'Seperated_data.mat';
save(strcat(save_path, name), 'CLASS');



