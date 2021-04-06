function Rv = spatialCrossCorrMatEstimation(V)
%% Spatial crosscorrelation matrix estimation
% Estimates the spatial auto-correlation matrix
% Input:
%        V - mxn matrix.
%            m - number of signals
%            n - number of time recordings

[m,n] = size(V);
Rv = V*V'/n;

end