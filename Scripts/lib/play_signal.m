function M=  play_signal(signal, target, speed,window_length, colors)

[len_signals, num_signals] = size(signal);

f = figure;
f.NextPlot = 'replaceChildren';
M(len_signals-window_length+1) = struct('cdata',[],'colormap',[]);
f.Visible = 'off';

dy = max(signal)-min(signal);
ymin = min(signal) - dy/100;
ymax = max(signal) + dy/100;
change = abs(conv(target,[1 -1],'valid')) > 0;

for i = 1:len_signals-window_length+1
    clf
    change_window = change(i:i+window_length-2);
    change_index = [1 find(change_window) window_length];
    change_target = target(i+change_index(1:end-1));
    
    for si = 1:num_signals
        subplot(num_signals,1,si);
        axis([1 window_length ymin ymax]);
        hold on
        for box_i = 1:length(change_index)-1
            xbox = [change_index(box_i) change_index(box_i),...
                    change_index(box_i+1) change_index(box_i+1),...
                    change_index(box_i)];
            ybox = [ymin ymax ymax ymin ymin];
            patch(xbox, ybox, 'black', 'FaceColor', colors(change_target(box_i)+1,:), 'FaceAlpha', 0.5);
        end    
        plot(signal(i:i+window_length-1,si), 'b');
        hold off
    end
    M(i) = getframe;
    i/(len_signals-window_length+1)
end
f.Visible = 'on';

