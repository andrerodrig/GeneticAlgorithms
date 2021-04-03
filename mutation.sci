function [new_descendants] = mutation(descendants, prob_indiv, prob_gene)
    [drows, dcols] = size(descendants);
    descend_matrix = descendants;

    for i = 1:drows
        prob_random = rand();

        if (prob_random < prob_indiv)
            for j = 1:dcols
                prob_random = rand();
                if (prob_random < prob_gene)
                    if (descendants(i,j) == 1) then
                        descend_matrix(i,j) = 0;
                    else
                        descend_matrix(i,j) = 1;
                    end
                end
            end
        end
    end
    new_descendants = return(descend_matrix);

endfunction