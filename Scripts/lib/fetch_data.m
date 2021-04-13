function SIGNALS = fetch_data(file_path)
%% Fetch data
% This files simply fetches the training data and puts all the signals in a
% variable called SIGNALS which then is saved in the .mat file 'SIGNALS'.

%% Get files
files = dir(file_path);

%% Initiate
numfiles = length(files);
SIGNALS = cell(1,numfiles);

%% Store
for i = 1:numfiles
    f = files(i);
    file = strcat(f.folder, filesep,f.name);
    SIGNALS{i} = load(file);
end




