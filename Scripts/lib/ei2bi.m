function bi = ei2bi(ei,signal)
%% Epoch index to beat index
% Takes in a vector of epoch index and return the correspnding beat index
% in the signal "signal".
%
% Input:
%      ei - array of any shape but where the entries are positive integers.
%
%      signal - The signal structure that we are looking at
%
%


si = ei2si(ei,signal);
bi = si2bi(si,signal);
end