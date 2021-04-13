%% Feature over epoch 
%
% This scripts contains functions which turns the signal from each epoch
% into a plot. Doing nothing results into realizations, doing the histogram
% turns into a histogram look.

clear
%% add paths
load_paths;

%% Fetch data
load('..\..\Data\Seperated_Data\Training\Seperated_data.mat');

%% Basic setup
num_class = length(CLASS);

%% Realization over random sampled epochs
N = 9;
while true
    for ci = 1:length(CLASS)
       figure(ci)
       index = randperm(length(CLASS{ci}.data),N);
       for si = 1:N
           subplot(3,3,si);
           plot(CLASS{ci}.data{index(si)});
           xlabel('Beat');
           ylabel('rr duration (s)');
           title(strcat('RR realization of class',string(ci-1)));
       end
    end
    pause
end
%% Hisogram over random sampled epochs
N = 9;
while true
    for ci = 1:length(CLASS)
       figure(ci)
       index = randperm(length(CLASS{ci}.data),N);
       for si = 1:N
           subplot(3,3,si);
           histogram(CLASS{ci}.data{index(si)},[0:0.05:1.5]);
           xlabel('rr duration');
           ylabel(strcat('Epoch :', string(index(si)),...
                         ' Patient :',string(CLASS{ci}.patientID(index(si)))));
           title(strcat('RR histogram of class',string(ci-1)));
   
       end
    end
    pause
end

%% Auto correlation over random sampled epochs
N = 9;
while true
    for ci = 1:length(CLASS)
       figure(ci)
       index = randperm(length(CLASS{ci}.data),N);
       for si = 1:N
           subplot(3,3,si);
           autocorr(CLASS{ci}.data{index(si)});           
           title(strcat('RR histogram of class',string(ci-1)));
       end
    end
    pause
end
