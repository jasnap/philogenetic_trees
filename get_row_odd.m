%----------- get_row_odd-------------
%   Function that calculates odd rows
%
% Input: 
%       n - Number of input sequences
% Output:
%       odd - Number of odd sequences


function odd = get_row_odd(n)
    n = n - 3;
    odd = 1;
    for i = 1:n
        odd = odd + 2;
    end
end

