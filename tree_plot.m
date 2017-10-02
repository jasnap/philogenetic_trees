%-------------- tree_plot -----------
% This function plots the phylogenetic tree calculated by BrB algorithm
%
% Input:
%		optimal_model - Optimal model calculated by BrB
%		u_model - Optimal model with negative internal nodes
%

function tree_plot(optimal_model, u_model, score, name_matrix)
optimal_model(1) = 1;
n = length(optimal_model);
nodes = zeros(1, n);
j = 1;
%find parents
for i = 1:n
    if(u_model(i) < 0)
        u_parents(j) = i;
        o_parents(j) = optimal_model(i);
        j = j + 1;
    end
end
j = 1;
m = length(u_parents);
for i = 1:n
    if(any(optimal_model(i) == o_parents))
        [ch1 ch2] = children(u_model, u_model(i));
        if(ch1 > 0 && ch2 > 0)  % if children are both leaves
            nodes(ch1) = optimal_model(i);
            nodes(ch2) = optimal_model(i);
        else
            index1 = find(u_model == ch1);
            index2 = find(u_model == ch2);
            ch1 = optimal_model(index1);
            ch2 = optimal_model(index2);
            nodes(ch1) = optimal_model(i);
            nodes(ch2) = optimal_model(i);
        end
    end

end
figure
nodes(1) = max(optimal_model);
treeplot(nodes, 'o', 'k')
title(['Phylogenetic tree using Maximum Parsimony with score ',num2str(score)])
ylabel('Evolutionary distance')
[x,y] = treelayout(nodes);

 for ii=1:length(name_matrix)
     text(x(ii), y(ii)-0.02, name_matrix(ii));
 end
set(gca,'XtickLabel',[],'YtickLabel',[]);
xlabel('')
camroll(90)
end
