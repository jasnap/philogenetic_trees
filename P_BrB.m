%---------------- P_BrB ------------------------
%	This function implements parallel Branch and bound on CPU
%
% Input: 
%		set_of_seq - Set of sequences for calculating trees
% Output:
%		optimal_score - Calculated optimal score
%		optimal_model - Model with the calculated optimal score
%

function [optimal_score, optimal_model] = P_BrB(set_of_seq, name_matrix)
    [row, col] = size(set_of_seq)
    last_id = last_tree(row);
    best_score = Inf;
    
    partID = partial_treeID(row);
    [mrow, mcol] = size(partID);   
    
    [row col] = size(partID);
    tic
    a = distributed(rot90(partID));
    spmd
        p = rot90(getLocalPart(a), -1);
    end
    
    spmd
        [mrow, mcol] = size(p);
        for i = 1:mrow
            %score first partial tree
            first_id = p(i, :);
            [first_model,first_score] = FitchScoring(first_id, set_of_seq);
            prev= first_id;
            if(first_score < best_score)
                %score all derivative trees
                for j = 1:last_id(end)
                    new_id = gen_complete_tree(prev, last_id);
                    prev = new_id;
                    [new_model,new_score] = FitchScoring(new_id, set_of_seq);
                    if(new_score <= best_score)
                        best_score = new_score;
                        best_model = new_model;
                        model = treeModelGen(new_id);
                        test_id = new_id;
                    end
                end
            end
        end
    end
    toc
    optimal_model = gather(best_model);
    optimal_score = gather(best_score);
    temp_umodel = gather(model);
    [row, col] = size(optimal_score);
    optimal_id = gather(test_id);
    temp_score = Inf;
    for i = 1:col
        if(optimal_score{i} <= temp_score)
            temp_score = optimal_score{i};
            temp_model = optimal_model{i};
            umodel = temp_umodel{i};
            tree_plot(temp_model, umodel, temp_score, name_matrix);        
        end
    end
   
end
