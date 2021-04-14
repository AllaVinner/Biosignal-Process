%% Init investigation
clear

%% add paths
load_paths;

%% Fetch data
load('..\..\Data\Filtered_Data\Training\Filtered_data.mat');


%% Pick a signal
s = SIGNALS{1};
rr = s.rr;
tt = s.targetsRR;

%% Init parameters
speed = 0.01;
window_length = 500;
colors = [0.99 0.8 0.8;
          0.8 0.8 0.99];

%% Play 
play_signal(rr', tt', speed,window_length, colors)


%% Play close to an epoch
random_epoch = 2*randperm((length(s.es)-1)/2,1);

buff = 500;
starting = s.es(random_epoch)-buff;
ending = s.es(random_epoch)+s.ed(random_epoch)-1+buff;

%% Play
play_signal(rr(starting:ending)', tt(starting:ending)', speed,500, colors)





