%% Heart beat investegation

clear


%% Load signal
load SIGNALS
s = SIGNALS{2};

%% Plot over sample index
figure
hold on
plot(s.qrs(1:end-1),s.rr,'g')

plot(s.qrs,0.7*ones(length(s.qrs),1),'b.');
stairs(s.afBounds(:,1),s.afBounds(:,2),'r');
stairs(s.qrs,s.targetsQRS+0.1,'b');
stairs(s.qrs(1:end-1),s.targetsRR+0.05,'c');
xlabel('Sample index');
legend( 'rr',...
        'qrs (beat, no y-axis)',...
        'afBounds classes',...
        ' target qrs classes',...
        ' target rr classes');


