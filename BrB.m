%----------------- BrB --------------------
%	This function implements Branch and bound optimization of Maximum Parsimony
%
% Input: 
%		set_of_seq - Set of data with important information about sequences
% Output:
%		optimal_score - Optimal score calculated
%		optimal_model - Model with the optimal score
%

function [optimal_score, optimal_model] = BrB(set_of_seq, name_matrix)
    
    [row, col] = size(set_of_seq);
    last_id = last_tree(row);
    best_score = Inf;
    k = 1;
    partID = partial_treeID(row);
    [mrow, mcol] = size(partID);
    for i = 1:mrow
        %score first partial tree
        first_id = partID(i, :);
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
                    best_id = new_id;                    
                    k = k + 1;
                end
            end
        end
    end
    optimal_score = best_score;
    optimal_model = best_model;
    tree_plot(optimal_model, model, optimal_score, name_matrix);  
end

