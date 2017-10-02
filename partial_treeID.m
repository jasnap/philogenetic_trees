%------------ partial_treeID(n)--------------------------
%
%   This function generates all partial trees for given number of sequences
%
% Input: 
%       n - Number of input sequences
% Output:
%       matrix - Matrix containing all possible partial trees

function matrix = partial_treeID(n)
    init_id = zeros(1, 2);
    init_id(:, 3:n) = 1;
    init_id(end) = 0;
    last_id = [zeros(1, 2) 1];
    k = 1;
    for i = 3 : n - 1
        last_id(i + 1) = last_id(i) + 2;
    end
    last_id(end) = 0;
    levels = n - 1;
    p = levels;
    ID = init_id;
    flag = 1;

    while(flag)
        for j = 1:last_id(n-1)
            temp = j;
            ID(end-1) = temp;
            matrix(k, :) = ID;
            k = k + 1;
        end
        if(isequal(ID, last_id))
            flag = 0;
            break;
        end
		
        if(p > 3)
            if(isequal(ID(:, p:length(ID)),last_id(:, p:length(last_id))))
                p = p - 1;
                tmp = ID(p) + 1;
                ID(p) = tmp;
                
            else
                tmp = ID(p) + 1;
                ID(p) = tmp;
                ID(end-1) = 0;
            end
        else
            tmp = ID(p) + 1;
            ID(p) = tmp;
        end    
    end

end


