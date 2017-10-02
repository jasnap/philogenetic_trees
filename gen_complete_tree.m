%------------ gen_complete_tree(previous, last)----------------------
%
%   This function generates a complete tree based on inputs previous and
%   last
%
% Input:
%       previous - Previous complete tree that was scored
%       last - Last possible complete tree that can be derived from given
%       partial tree
% Output:
%       t - Calculated complete tree

function t = gen_complete_tree(previous, last)
    next_tree = previous;
    if(next_tree(end) ~= last(end))
        next_tree(end) = previous(end) + 1;
        t = next_tree;
    else
        disp('t is zero')
        t = 0;
    end

end

