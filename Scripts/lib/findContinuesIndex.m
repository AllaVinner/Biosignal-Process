function ti = findContinuesIndex(t,s)
%% Find continues index
% This function calculates the sample index from a time. Often we have a
% vector with time-samples (s) which relates sample-indeces to times, this
% function is a form of inverse. However since t is continues and sample
% index are descrete this function makes a linnear interpolation between
% the samples which are closest to the values t. 
%
% Input:
%         t - time vector of size mx1
%             The values in t needs to be within the range of s.
%         s - sample vector of size nx1
%             s needs to be monotonically increasing.
%
% s defines a function from index I to time T. This function defines a
% function from t to index ti given the function s.
%
% Output:
%         ti - time index vector mx1
%              The indeces the value t would have had if they were in s.
%
% For biologicalsignals course
%
%     qrs is here a function between beat-index and measure-index.
%     f(v) = findContinuesIndex(v,qrs), is then a function between
%     measure-index and beat-index.
%
%     afbounds(i,1) is a function between shift-index and measure index.
%     f(v) = findContinuesIndex(v,afBounds(:,1)), is then a function
%     between measure-index and shift-index.
%
%     
%

%% Assertions
assert(all(diff(s)>=0),'Samples in s has to be increasing');
assert(all(t >=s(1)),'t must be greater or eqaul to the first value of s');
assert(all(t<=s(end)),'t must be smaller or eqaul to the last value of s');

%% Calculations
t0 = find(t <= s',1)-1;
t0(t0==0) = 1;
ti = t0 + (t-s(t0))/(s(t0+1)-s(t0));

end