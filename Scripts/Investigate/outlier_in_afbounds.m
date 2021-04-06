%% Investigate outlier in afBounds
% in the fourth signal there seems to be something weird happening since
% there are two following eachother zeros in the afBounds set at index
% 135-136 with values 7669200 and 7672425.
clear
%% Load signal
load SIGNALS
s = SIGNALS{4};

%% Show issue
issue_region = s.afBounds(130:140,:)

%% Corresponding signal index
[v1,i1] = min(abs(s.qrs - s.afBounds(135,1)));
[v2,i2] = min(abs(s.qrs - s.afBounds(136,1)));
ii = findContinuesIndex(s.afBounds(135,1), s.qrs)
%% Plot region
buffer = 200;
figure
hold on
plot(s.targetsQRS(i1-buffer:i2+buffer),'b')
plot([buffer buffer+i2-i1], 1/2*[1 1],'*r','LineWidth',2)
legend('Signal','positions with 0:s') 

%% Analysis
%Seems like the second number is wrong...
% afBound(136,:) is wrong and shoul dbe excluded









