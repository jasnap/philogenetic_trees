%------------ ExhaustiveSearch -----------
%   This function for searching trees with Exhaustive search method
%
% Input: 
%        set_of_seq - Matrix that contains all input sequences
% Output: 
%        optimal_score - Best score of all trees
%        optimal_model - Tree model for the best score         

function [optimal_score, optimal_model] = ExhaustiveSearch(set_of_seq, name_matrix)
    [row, col] = size(set_of_seq);
    id = treeID(row);
    best_score = Inf;
    k = 1;
    [id_row, id_col] = size(id);
    for i = 1:id_row
        type = tree_type(id(i,:));
        if type == 2
            [out_model, out_score] = FitchScoring(id(i, :), set_of_seq);
            if out_score <= best_score
                best_score = out_score;
                best_model = out_model;
                model = treeModelGen(id(i, :));
            end
        end
    end
    optimal_model = best_model;
    optimal_score = best_score;
    tree_plot(optimal_model, model, optimal_score, name_matrix);
end



