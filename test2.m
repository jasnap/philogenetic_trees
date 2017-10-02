%---------------- test2 ------------------------------
%	This test runs Branch and Bound and Exhaustive Search

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
%Search using improved Branch and Bound
tic
[optimal_score, optimal_model] = BrB(set_of_seq, name_matrix);
toc


%% Search using Exhaustive Search
tic
[optimal_score1, optimal_model1] = ExhaustiveSearch(set_of_seq, name_matrix);
toc

