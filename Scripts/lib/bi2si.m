function si = bi2si(bi,signal)
%% beat index to sample index
% Takes in a vector of beat index and return the correspnding sample index
% in the signal "signal".
%
% Input:
%      bi - array of any shape but where the entries are positive integers.
%
%      signal - The signal structure that we are looking at
%
%

si = signal.qrs(bi);

end