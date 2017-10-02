%------------- fasta_rd --------------
% 	This function preprocesses input fasta sequences
%
% Input: 
%		f - Read fasta file
% Output:
%		data - Data readable for the BrB function
%
function data = fasta_rd(f)

    SeqsMultiAligned = multialign(f);

    [row, col] = size(SeqsMultiAligned);
    for i = 1:row
        temp = SeqsMultiAligned(i).Sequence;
        matrix{i, :} = temp;
    end
    for i = 1:row
      data(i, :) = matrix{i}; 
    end
    [row, col] = size(data);
    for i = 1:row
        for j = 1:col
          if(~isequal(data(i, j), 'A')...
		  && ~isequal(data(i, j), 'C')...
		  && ~isequal(data(i, j), 'T')...
		  && ~isequal(data(i, j), 'G'))  
            data(i, j) = '-';
          end
        end
    end
end


