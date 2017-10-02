%------------- nwk(tree)---------
%   This function returns a Newick file format of the tree, and draws a
%   phylogenetic tree
%
% Input: 
%       s_model - Tree model that had been scored 
%       u_model - TreeID of the model that had been scored
% Output:
%       tree_matrix - A matrix for generating phytree object
%       Newick file .tree which can be found in the working directory

function tree_matrix = nwk(s_model, u_model, score)
    j = 1;
    flag = 1;
    [row, col] = size(u_model);
    temp_umodel = u_model;
    d = zeros(row, col);
   
   while(flag)
    for i = length(u_model):-1:1
        if(d(i) == 0 && u_model(i) < 0)
            [ch1 ch2] = children(u_model, u_model(i)); % find its children
            if(ch1 > 0 && ch2 > 0)  % if children are both leaves
                d(i) = 1;
                tree_matrix(j, :) = [ch1 ch2];  % put them in the matrix for phytree
                temp_umodel = temp_umodel(temp_umodel ~= ch1 & temp_umodel~=ch2);   % delete them from the temp model
                %temp_umodel(i) = s_model(i);
                u_model(i) = s_model(i);
                j = j + 1;      % temp_umodel now has parents as leaves
                                % and leaves are deleted
            end
        end
    end
    if(isequal(u_model(2:end), s_model(2:end)))
        flag = 0;
        break;
    end
   end
    tree_matrix(end+1, :) = [s_model(2) u_model(1)];
    phy_tree = phytree(tree_matrix);
    plot(phy_tree);
    title(['Phylogenetic tree using Maximum Parsimony with score ',num2str(score)])
    ylabel('Evolutionary distance')
    %Generate Newick formated tree file
    %phytreewrite('newtree.tree',phy)
end




