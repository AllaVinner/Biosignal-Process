%% Heart beat investegation

clear


%% Load signal
load SIGNALS
s = SIGNALS{2};

%% Set up time 
figure
hold on
plot(s.qrs(1:end-1),s.rr,'g')
plot(s.qrs,0.7*ones(length(s.qrs),1),'b.');
stairs(s.afBounds(:,1),s.afBounds(:,2),'r');
stairs(s.qrs,s.targetsQRS+0.1,'b');
stairs(s.qrs(1:end-1),s.targetsRR+0.05,'c');
xlabel('Sample index');
legend('time between heart beats (s)', 'Each heart beat','Class of period',...
        ' target qrs')


