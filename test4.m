%--------------- test4 -------------------
% This test runs a parallel Branch and bound on all iguanas data set on a CPU

% %Example with iguanas
clc
clear all
data_iguana = { 'Anolis'      'ATGACAATTACACGCAAATCCCACCCAATTTTCAAAATTATTAACGACTCCTTTATTGAT';
                'Basili'      'ATGACAATCCTACGAAAATCCCACCCAATCCTTAAAATAATCAACTCTTCATTCATCGAC';
                'Chalar'      'ATGACAATCATCCGAAAAACACACCCAATTTTCAAAATTGTAAACGACTCATTCATTGAC';
                'Gambel'      'ATGACAATCACACGAAAATCCCACCCGATCATCAAAATCGTAAACAACTCATTTATTGAC';
                'Leioce'      'ATGACAATCACACGAAAAACT5CACCCACTATTTAAAATCATCAATAACTCCTTTATTGAC';
                };

%Create a matrix with al sites with usefull information
[row, col] = size(data_iguana);
for i = 1:row
    temp = data_iguana{i, 2};
    matrix{i, :} = temp;
    names = data_iguana{i, 1};
    name_matrix{i, :} = names;
end

for i = 1:row
  data(i, :) = matrix{i};      
end
set_of_seq = non_inf_sites(data, 3); 

parpool()  
[optimal_score, optimal_model] = P_BrB(set_of_seq, name_matrix);
delete(gcp)
     