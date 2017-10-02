
%  ------------- LOOKUP TABLE ------------
%   This lookup table serves for converting string characters in a string
%   sequence into decimal or binary equivalents

% Creating the lookup table
function output = lookup_table(input)
    lut = cell(16, 4);
    lut(1, 1) = {'-'};
    lut(2, 1) = {'A - Adenosine'};
    lut(3, 1) = {'C - Cytosine'};
    lut(4, 1) = {'M - aMino'};
    lut(5, 1) = {'G - Guanine'};
    lut(6, 1) = {'R - puRine'};
    lut(7, 1) = {'S - Strong'};
    lut(8, 1) = {'V - not T'};
    lut(9, 1) = {'T - Thymidine'};
    lut(10, 1) = {'W - Weak'};
    lut(11, 1) = {'Y – pYrimadine'};
    lut(12, 1) = {'H – not G'};
    lut(13, 1) = {'K – Ketone'};
    lut(14, 1) = {'D – not C'};
    lut(15, 1) = {'B – not A'};
    lut(16, 1) = {'N – aNy'};
    lut(1, 2) = {'-'};
    lut(2, 2) = {'A'};
    lut(3, 2) = {'C'};
    lut(4, 2) = {'AC'};
    lut(5, 2) = {'G'};
    lut(6, 2) = {'AG'};
    lut(7, 2) = {'CG'};
    lut(8, 2) = {'ACG'};
    lut(9, 2) = {'T'};
    lut(10, 2) = {'AT'};
    lut(11, 2) = {'CT'};
    lut(12, 2) = {'ACT'};
    lut(13, 2) = {'GT'};
    lut(14, 2) = {'AGT'};
    lut(15, 2) = {'CGT'};
    lut(16, 2) = {'ACGT'};
    lut(1, 4) = {0000};
    lut(2, 4) = {0001};
    lut(3, 4) = {0010};
    lut(4, 4) = {0011};
    lut(5, 4) = {0100};
    lut(6, 4) = {0101};
    lut(7, 4) = {0110};
    lut(8, 4) = {0111};
    lut(9, 4) = {1000};
    lut(10, 4) = {1001};
    lut(11, 4) = {1010};
    lut(12, 4) = {1011};
    lut(13, 4) = {1100};
    lut(14, 4) = {1101};
    lut(15, 4) = {1110};
    lut(16, 4) = {1111};

    for i = 0 : 15 
        lut(i+1, 3) = {i};
    end
    % Creating the output sequence 

    [row, column] = size(lut);
    for i = 1 : numel(input) 
        for j = 1 : row
            if( size(input(i)) == size(lut{j, 2}))    
               if(strcmp(input(i), lut{j, 2}))            
                    output(i) = lut{j, 3};
               end
            end
        end
    end
    
end


