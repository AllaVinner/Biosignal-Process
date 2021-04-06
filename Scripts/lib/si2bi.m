function bi = si2bi(si, signal)
%% Sample index to beat index
% Takes in a vector of sample index and return the correspnding beat index
% in the signal "signal". If the sample index is between beats, the
% function will return the next beat index.
%
% Input:
%      si - array of any shape but where the entries are positive integers.
%
%      signal - The signal structure that we are looking at
%
%

bi_continues = findContinuesIndex(si, signal.qrs);

% Since the classification allways start at beat AFTER the signal turns AF,
% we will choose the upper value.
bi = ceil(bi_continues);

end