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
[row1, col1] = size(set_of_seq);
partID = partial_treeID(row1);
dlmwrite('primates_seq.txt', set_of_seq,'newline', 'pc');