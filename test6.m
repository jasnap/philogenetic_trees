%--------------- test6 -------------------
% This test runs a parallel Branch and bound on primates data set on a CPU

% Example with primates
 clc
 clear all
 load('primates.mat')
 SeqsMultiAligned = multialign(primates);
 [row, col] = size(SeqsMultiAligned);

for i = 1:col
    temp = SeqsMultiAligned(i).Sequence;
    matrix{i, :} = temp;
    names = SeqsMultiAligned(i).Header;
    name_matrix{i, :} = names;
end

for i = 1:col
  data(i, :) = matrix{i};     
end
 
set_of_seq = non_inf_sites(data, 3);
parpool()  
[optimal_score, optimal_model] = P_BrB(set_of_seq, name_matrix);
delete(gcp)