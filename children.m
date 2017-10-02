%---------------- children ----------
%   Function for finding all children nodes
%
% Input: 
%          model - Tree model 
%          node - Parent node for which it's finding
% Output: 
%          child1 - First child node
%          child2 - Second child node

function [child1, child2] = children(model,node)

    offset = 2*abs(node) + 1;
    child1 = model(offset);
    child2 = model(offset + 1);

end

