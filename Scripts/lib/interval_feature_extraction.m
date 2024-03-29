function feat = interval_feature_extraction(fun, CLASS, n)
%% Intervall feauture extraction
% The function go through all epochs in each class and performs the
% function 'fun' over an interval of length n. Hense, fun needs to be a
% function from an n-vector to a scalar.
%
% CLASS needs to have fields:
%                            data

num_class = length(CLASS);
%% Find number of outputs
u = zeros(n,1);
v = fun(u);
num_out = length(v);

%% Find how many features in each class
num_feat = zeros(num_class,1);
for ci = 1:num_class
   num_epoch = length(CLASS{ci}.data);
   for ei = 1:num_epoch
      num_beat = length(CLASS{ci}.data{ei}); 
      num_feat(ci) = num_feat(ci) + max(0,num_beat-n+1);      
   end   
end

%% Initiate f
feat = cell(num_class,1);
for ci = 1:num_class
   feat{ci} = zeros(num_feat(ci),num_out); 
end

%% Calculate f
idx_feat = zeros(num_class,1);
for ci = 1:num_class
   num_epoch = length(CLASS{ci}.data);
   for ei = 1:num_epoch
      num_beat = length(CLASS{ci}.data{ei}); 
      num_iter = max(0,num_beat-n+1);
      for ii = 1:num_iter
          idx_feat(ci) = idx_feat(ci) + 1;
          y = CLASS{ci}.data{ei}(ii:ii+n-1);
          feat{ci}(idx_feat(ci),:) = fun(y);
      end
   end
end

end

