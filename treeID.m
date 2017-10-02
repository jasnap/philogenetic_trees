%--------------- treeID ---------------
%	This function generates all possible trees
%
% Input: 
%		n - Number of input sequences
% Output
%		output - matrix with all possible trees and theis id numbers

function output = treeID(n)
    row = get_row_count(n);
    output = zeros(row, n);
    
    % set 3rd column to 1
    output(:,3) = 1;
    
    % setting last row
    last_row_odd = get_row_odd(n);
    for i = n-3:row
        output(i,n) = mod(i + 3 - n,last_row_odd + 1);
    end
   
    % setting subdefault rows
    for i = 2:n-4
        for j = 4:i+2
            output(i,j)=1;
        end
    end
    
    divisor = last_row_odd + 1;
    % setting other cols
    for col = (n-1):-1:4
        for i = n-3:row
            aa = i + 4 - n;
            temp = ceil(aa/divisor);
            if temp > get_row_odd(col)
                temp = mod(temp, get_row_odd(col));
                if temp == 0
                    temp = get_row_odd(col);
                end
            end
            output(i,col) = temp;
        end
        divisor = divisor * get_row_odd(col);
    end 
end




