%----------- non_inf_sites --------------
%	This function removes all noninformative sites in a sequence
%
% Input: 
%		set_of_seq - Matrix of input sequences
%       fact - Similarity factor
% Output:
%		output - Matrix with all sequences where the non informative sites are removed

function output = non_inf_sites(set, fact)
    [row, col] = size(set);
    
    for i = 1:row
        M(i, :) = lookup_table(set(i, :));
    end

    [row, col] = size(M);

    for j = 1:col
        for i = 1:row
            score1(j) = sum(M(:, j) == 1);
            score2(j) = sum(M(:, j) == 2);
            score3(j) = sum(M(:, j) == 4);
            score4(j) = sum(M(:, j) == 8);
        end
    end

    scoring_matrix = [score1;score2;score3;score4];

    % %distrubution of a number in array
    [srow, scol] = size(scoring_matrix);

    B = scoring_matrix == fact;   

    k = 1;
    duplicate = 0;
     for i = 1:scol
         for j = 1:srow
             if(B(j, i) == 1 && duplicate ~= i)
                duplicate = i;
                flag = 1; 
                output(:, k) = M(:, i);
                k = k + 1;
             end
         end
     end
end


