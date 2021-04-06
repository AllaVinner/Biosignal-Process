function Rxv = spatialCrossCorrMatEstimation(X,V)
%% Spatial crosscorrelation matrix estimation
% Estimates the spatial crosscorrelation matrix
% Input:
%        X - m1xn matrix.
%            m1 - number of signals
%            n - number of time recordings
%
%        V - m2xn matrix.
%            m2 - number of signals
%            n - number of time recordings
%
% Special case here is when X is a row vector and the return value is then
% the cross-correlation vector r_xv.

%% Assertions
assert(size(V,2) == size(X,2), 'X and V must have same number of columns');

%% Calculation
[mv,n] = size(V);
Rxv = X*V'/n;

end