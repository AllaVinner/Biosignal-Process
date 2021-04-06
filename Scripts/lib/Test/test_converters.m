%% Test converters



clear
%% Load signal
load SIGNALS
s = SIGNALS{4};



%% Try inverse 

%% SI
si = [1000 2000 3000]';
%% 
si2ei(si, s)
si2ei2si = ei2si( si2ei(si, s),s)
% Not ment to go that well...

%%
si2bi2si = bi2si( si2bi(si, s),s)
% Much better and closer...

%% EI
ei = [1 4 10 length(s.afBounds(:,1))]';
%% 
ei2si2ei = si2ei( ei2si(ei, s),s)
% Went great

%%
ei2bi(ei, s)
ei2bi2ei = bi2ei( ei2bi(ei, s),s)
% Great but cant handel ei = 1; (ei2bi which is the problem)

%% BI
bi = [1 100 2000 length(s.qrs)]';
%% 
bi2si2bi = si2bi( bi2si(bi, s),s)
% Works great

%%
bi2ei2bi = ei2bi( bi2ei(bi, s),s)
% Do not work for bi = 1 (ei2bi which is the problem)


%% Try itteration
%% SI
si = [1000 2000 3000]';
%% 
si= ei2si( si2ei(si, s),s)
% Not ment to go that well...

%%
si = bi2si( si2bi(si, s),s)
% Much better and closer...

%% EI
ei = [1 4 10]';
%% 
ei = si2ei( ei2si(ei, s),s)
% Went great

%%
ei = bi2ei( ei2bi(ei, s),s)
% Great but cant handel ei = 1; (ei2bi which is the problem)

%% BI
bi = [1 100 2000]';
%% 
bi = si2bi( bi2si(bi, s),s)
% Works great

%%
bi = ei2bi( bi2ei(bi, s),s)
% Do not work for bi = 1 (ei2bi which is the problem)













