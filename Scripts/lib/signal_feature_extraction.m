function feat = signal_feature_extraction(fun,signal, n)
%% signal feature extraction
% This function goes through the vector 'signal' and performs the function
% 'fun' on each interval of length(n). This gives an output of length
% signal length - n + 1 = num_feat, where each outpit is of dimension
% length(fun) = num_out.
%

num_feat = length(signal)-n+1;
num_out  = length(fun(zeros(n,1)));
feat  =zeros(num_feat,num_out);
for i = 1:num_feat
   feat(i,:) = fun(signal(i:i+n-1)); 
end
    
end








