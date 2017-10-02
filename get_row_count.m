%------- get_row_count --------
%   This function calculates the number of all possible trees for a set of
%   sequences
%
% Input:
%       n - Number of input sequences
% Output:
%       number - Number of possible trees

function number = get_row_count(n)
    if(n > 2)
        number = 1 + factd(2*(n-1)-5) + factd(2*n-5);
    else
        number = 0;
    end
end




    