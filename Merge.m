%-------------- Merge -------------
%	This function merges child nodes with parent nodes, and returns the parent
%	node and the calculated score
%
% Input: 
%		seq1 - First child node sequence
%		seq2 - Second child node sequence
% Output:
%		score - Score of the merging
%		out_seq - Merged parent sequence

function [score, out_seq] = Merge (seq1, seq2)

     score = 0;
     for i = 1:length(seq1)
         
        if (bitand(seq1(i), seq2(i)) ~= 0)
            out(i) = bitand(seq1(i), seq2(i));
        else
            out(i) = bitor(seq1(i), seq2(i));
            score = score + 1;
        end
        
     end
     out_seq = out;
end 
