clc
clear all
f = fastaread('longula_short.fst');

[row col] = size(f);
for i = 1:row
    name_matrix{i, :} = f(i).Header;
end

data = fasta_rd(f);
set_of_seq = non_inf_sites(data, 2); 
[row, col] = size(set_of_seq);
partID = partial_treeID(row);
dlmwrite('longula_seq.txt', set_of_seq,'newline', 'pc');