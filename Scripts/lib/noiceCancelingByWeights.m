function [s,w] = noiceCancelingByWeights(x,V)
%% Noise canceling by weights
% The cancels the noice by weight estimation.
% We assume that x is given by the sum x = s + v0, where s is our desired
% signal and v0 is a noice input. The noise input is recorded by M
% recordings stored as v1 - vM which is sent into the function as V (each
% row is a new signal). With the assumption that the noise-signals and
% target signal is uncorrelated we set the weights to calncel the noise and
% returns the filtered signal and the constructed weights.
%
% Input:
%       x - recorded signal(s). 
%           Size is typicaly 1xn but could be m x n;
%
%       V - recorded noise signal
%           Size: Mxn
%
% Outpu:
%       s - mxn matrix (typicaly 1xn) with the filtered signal.
%       w - Mxm matrix (typically Mx1) with the filter weights.
%
% n - number of time recordings
% m - number of dimensions of the input/output signal
% M - number of noise recordings
%
        


%% Calcualte
Rv = spatialAutoCorrMatEstimation(V);
rxv = spatialCrossCorrMatEstimation(x,V);
w = Rv\rxv;
s = x - w'*V;
end