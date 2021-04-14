function play_signal(signal, target, speed,window_length, colors)

[len_signals, num_signals] = size(signal);

figure
current_class = target(1);
dy = max(signal)-min(signal);
ymin = min(signal) - dy/100;
ymax = max(signal) + dy/100;

for i = 1:len_signals-window_length+1
    for si = 1:num_signals
        subplot(num_signals,1,si);
        plot(signal(i:i+window_length-1,si));
        set(gca,'color', colors(current_class+1,:));
        axis([1 window_length-1 ymin ymax]);
    end
    current_class = target(i+window_length/2);
    pause(speed) 
end

