function si = ei2si(ei,signal)
%% Epoch index to sample index
% Takes in a vector of epoch index and return the correspnding sample index
% in the signal "signal".
%
% Input:
%      ei - array of any shape but where the entries are positive integers.
%
%      signal - The signal structure that we are looking at
%
%


si = signal.afBounds(ei,1);

end