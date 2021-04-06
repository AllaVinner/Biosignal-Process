function ei = si2ei(si, signal)
%% Sample index to epoch index
% Takes in a vector of sample index and return the correspnding epoch index
% in the signal "signal". If the sample index is between epoch, the
% function will return the index the sample belongs to which is the
% PREVIOUS epoch index.
%
% Input:
%      si - array of any shape but where the entries are positive integers.
%
%      signal - The signal structure that we are looking at
%
%

ei_continues = findContinuesIndex(si, signal.afBounds(:,1));

ei = floor(ei_continues);

end