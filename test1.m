%--------------- test1----------
%	Runs example for UPGMA and NJ 

clc
clear all

data = {'Anolis'      'ATGACAATTACACGCAAATCCCACCCAATTTTCAAAATTATTAACGACTCCTTTATTGAT';
        'Basili'      'ATGACAATCCTACGAAAATCCCACCCAATCCTTAAAATAATCAACTCTTCATTCATCGAC';
        'Chalar'      'ATGACAATCATCCGAAAAACACACCCAATTTTCAAAATTGTAAACGACTCATTCATTGAC';
        'Gambel'      'ATGACAATCACACGAAAATCCCACCCGATCATCAAAATCGTAAACAACTCATTTATTGAC';
        'Leioce'      'ATGACAATCACACGAAAAACTCACCCACTATTTAAAATCATCAATAACTCCTTTATTGAC';
       };
for ind = 1:length(data)
    f(ind).Header   = data{ind,1};
    f(ind).Sequence = data{ind,2};
end

% UPGMA
distances = seqpdist(f,'Method','Jukes-Cantor','Alpha','DNA');
UPGMAtree = seqlinkage(distances,'UPGMA',f);
h = plot(UPGMAtree, 'orient', 'top');
title('UPGMA Distance Tree of Iguanas using Jukes-Cantor model');
ylabel('Evolutionary distance')


% NJ
NJtree = seqneighjoin(distances,'equivar',f);
h = plot(NJtree, 'orient', 'top');
title('Neighbor-Joining Distance Tree of Iguanas using Jukes-Cantor model');
ylabel('Evolutionary distance')
