%% Investigate feature over class epochs
%
% This script aims at investigate the epochs of each class and specifically
% how long the average heart beat is and the std of that spread.
%
%    FEATURES:
%              Means
%              Std
%              skewness
%
%   CORRELATIONS
%
%

clear
%% add paths
load_paths;

%% Fetch data
load('..\..\Data\Seperated_Data\Training\Seperated_data.mat');

%% Basic setup
num_class = length(CLASS);

%% Define features
num_feat = 3;
m = cell(num_class,1);
s = cell(num_class,1);
sk = cell(num_class,1);

for ci = 1:num_class
    le = length(CLASS{ci}.data);
    m_temp = zeros(le,1);
    s_temp = zeros(le,1);
    sk_temp = zeros(le,1);
    
    for ei = 1:le
        m_temp(ei) = mean( CLASS{ci}.data{ei} );
        s_temp(ei) = std( CLASS{ci}.data{ei} );
        sk_temp(ei) = skewness( CLASS{ci}.data{ei} );
        
    end
    
    m{ci} = m_temp;
    s{ci} = s_temp;
    sk{ci} = sk_temp;
end

%%  Histogram over features (different plots)

for ci = 1:num_class
   figure
   
  
   subplot(num_feat,1,1);
   histogram(m{ci},[0:0.025:1.5]);
   title('Histogram over means');
   xlabel('RR time duration');
       
  
   subplot(num_feat,1,2);
   histogram(s{ci},[0:0.01:0.5]);
   title('Histogram over std');
   xlabel('RR time duration');
   
     
   subplot(num_feat,1,3);
   histogram(sk{ci},[-10:0.5:10]);
   title('Histogram over skewness');
   xlabel('RR time duration');
   
end

%% Histogram over features (same plot)
figure

subplot(num_feat,1,1);
hold on
title('Histogram over means');
xlabel('RR time duration');
histogram(m{1},[0:0.025:1.5]);
histogram(m{2},[0:0.025:1.5]);
legend('Normal', 'AF');

subplot(num_feat,1,2);
hold on
title('Histogram over std');
xlabel('RR time duration');
histogram(s{1},[0:0.01:0.5]);
histogram(s{2},[0:0.01:0.5]);
legend('Normal', 'AF');


subplot(num_feat,1,3);
hold on
title('Histogram over skewness');
xlabel('RR time duration');
histogram(sk{1},[-10:0.5:10]);
histogram(sk{2},[-10:0.5:10]);
legend('Normal', 'AF');


%% Correlations
%% Define correlations
num_corr = 5;
c = cell(num_class,1);

for ci = 1:num_class
    c_temp = zeros(le,num_corr);
    for ei = 1:le
        acorr = [autocorr(CLASS{ci}.data{ei}) zeros(1,num_corr)];
        c_temp(ei,:) = acorr(2:num_corr+1);
        
    end
    c{ci} = c_temp;
end

%% Plot correlations
figure
for i = 1:num_corr
    subplot(num_corr,1,i);
    hold on
    title('Histogram over auto correlation (WARNING bad graph) ');
    xlabel('Correlation ');
    histogram(c{1}(:,i),[-1:0.025:1]);
    histogram(c{2}(:,i),[-1:0.025:1]);
    legend('Normal', 'AF');
end
% Unreliable since nomrmal is sooo much longer henc slow degrading
% correlation. This is better for a window analysis
