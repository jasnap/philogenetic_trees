clear all
clc
data_iguana = { 'Anolis'      'ATGACAATTACACGCAAATCCCACCCAATTTTCAAAATTATTAACGACTCCTTTATTGAT';
                'Basili'      'ATGACAATCCTACGAAAATCCCACCCAATCCTTAAAATAATCAACTCTTCATTCATCGAC';
                'Chalar'      'ATGACAATCATCCGAAAAACACACCCAATTTTCAAAATTGTAAACGACTCATTCATTGAC';
                'Gambel'      'ATGACAATCACACGAAAATCCCACCCGATCATCAAAATCGTAAACAACTCATTTATTGAC';
                'Leioce'      'ATGACAATCACACGAAAAACTCACCCACTATTTAAAATCATCAATAACTCCTTTATTGAC';
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
 [rows, cols] = size(set_of_seq);
partID = partial_treeID(row);
dlmwrite('iguanas_seq.txt', set_of_seq,'newline', 'pc');