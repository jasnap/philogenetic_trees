%--------------- test5 -------------------
% This test runs a parallel Branch and bound on longula data set on a CPU

% Example with longula
clc
clear all
f = fastaread('longula.fst');

[row col] = size(f);
for i = 1:row
    name_matrix{i, :} = f(i).Header;
end

data = fasta_rd(f);
set_of_seq = non_inf_sites(data, 2); 

parpool()  
[optimal_score, optimal_model] = P_BrB(set_of_seq, name_matrix);
delete(gcp)