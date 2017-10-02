%------------- treeModelGen ---------------
%	This function generates a tree model based on the ID of the tree
%
% Input:
%		id - Identification number of the tree
% Output:
%		model - Generated model of the given tree id


function model = treeModelGen(id)
    model(1, 1) = 1; 
    model(1, 2) = 2;
    internal_node = 0;
    
    for i = 3:length(id)
        new_el = i;
        if(id(i) ~= 0)
            internal_node = internal_node - 1;
            io = id(i) + 1;
            add_to_end = model(io);
            model(io) = internal_node;
            model = [model( 1 : end) add_to_end new_el];
        end    
    end
end


