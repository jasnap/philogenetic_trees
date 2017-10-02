%-------------- last_tree --------------
%	This function calculates the last possible tree
%
% Input:
%		n - Number of sequences
% Output:
%		tree - Last possible tree
%

function tree = last_tree(n)
    tree = [zeros(1, 2) 1];
    for i = 3 : n - 1
        tree(i + 1) = tree(i) + 2;
    end
end


