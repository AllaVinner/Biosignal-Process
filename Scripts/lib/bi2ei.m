function ei = bi2ei(bi,signal)
%% Epoch index to beat index
% Takes in a vector of beat index and return the correspnding epoch index
% in the signal "signal".
%
% Input:
%      bi - array of any shape but where the entries are positive integers.
%
%      signal - The signal structure that we are looking at
%
%


si = bi2si(bi,signal);
ei = si2ei(si,signal);
end