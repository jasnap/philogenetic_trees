%---------------- tree_type--------------
%	This function finds if a tree is incomplete, partial or complete
%
% Input: 
%		tree - Id number of the tree
% Output:
%		type - Type of the tree
%
% 0 - incomplete
% 1 - partial
% 2 - complete

function type = tree_type(tree)
    
    num_of_zeros = sum(tree(:) == 0) - 2;
    last_index = size(tree);
    
    if num_of_zeros == 0
        type = 2;
    elseif num_of_zeros == 1
        if tree(last_index) == 0
            type = 1;
        else
            type = 0;
        end
    else
        type = 0;
    end
end




