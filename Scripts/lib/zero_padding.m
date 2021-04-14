function y_padded = zero_padding(y,x)
%% Zero padding
% Padds the vector y to be as long as x. 
% The padding is done equal on both sides if possible, otherwise it is done
% with one more at the end.

f = length(x)-length(y);
y_padded = [zeros(floor(f/2),1); y; zeros(ceil(f/2),1)];
end