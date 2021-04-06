%% Test find continues index



index = (1:0.25:3)';
v = [1 3 1.1 1.25 2.5 2.9]';


vi = findContinuesIndex(v,index)

% Should be the last index smaller then v
vv = index(floor(findContinuesIndex(v,index)))

d = [v vv vi]
id = [index'; 1:length(index)]

