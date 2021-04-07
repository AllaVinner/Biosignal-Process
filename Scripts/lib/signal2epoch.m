function [epoch_start, epoch_duration, epoch_class] = signal2epoch(target)
%% Target to epoch start
change = [1 conv(target, [-1 1],'valid')];
change(change ~= 0) = 1;
epoch_start = find(change == 1);
epoch_duration = diff([epoch_start length(target)+1]);
epoch_class = target(epoch_start);
end