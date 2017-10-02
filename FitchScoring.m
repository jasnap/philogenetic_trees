% -------------- FitchScoring------------
%   This function calculates score of a tree using Fitch scoring algorithm
%
% Input:
%       id - Id of the tree it is scoring
%       set_of_seq - Matrix of input sequences
% Output:
%       out_model - Model of the output tree
%       out_score - Calculated score

function [out_model, out_score] = FitchScoring(id, set_of_seq)
    model = treeModelGen(id);
    out_model = model;
    out_score = 0;
    new_node = model(end);
    k = 1;
    flag = 1;
    for i = 1:length(model)
        if model(i) < 0
            int_nodes1(1, k) = model(1,i);
            k = k+1;
        end
    end
    int_nodes = sort(int_nodes1);
    while flag == 1
        i = 1;
        while i<= length(int_nodes)
            temp = out_model;
            [ch1, ch2] = children(temp, int_nodes(i));

            if(ch1 > 0 && ch2 >0)
                [score, new_seq] = Merge(set_of_seq(ch1, :),set_of_seq(ch2, :));
                new_node = new_node + 1;
                temp(temp == int_nodes(i)) = new_node;
                set_of_seq(new_node, :) = new_seq;
                out_score = out_score + score;
                int_nodes(i) = [];
    
            end
            out_model = temp;
            i = i +1;
        end
        if(isempty(int_nodes))
            flag = 0;
        end
    end
    [score, new_seq] = Merge(set_of_seq(1, :),set_of_seq(new_node - 1, :));
    new_node = new_node + 1;
    set_of_seq(new_node, :) = new_seq;
    out_score = out_score + score;
    out_model(1) = new_node;
end



