function [selected_matrix] = selection(evaluated_vect)
    
    // Função responsável por selecionar os indivíduos para recombinação genética.
    n_cromoss = size(evaluated_vect)(1);
    n_crossover = ceil(n_cromoss/2);
    roulette = zeros(n_crossover, 2);

    total_evaluations = sum(evaluated_vect);
    percentual_evaluations = evaluated_vect./total_evaluations
    distributed_percentual_evaluations = cumsum(percentual_evaluations);

    selected_matrix = spin_roulette(n_crossover, distributed_percentual_evaluations);

endfunction

function [selected] = spin_roulette(total_crossovers, cumulative_percentuals)
    roulette = zeros(total_crossovers, 2);
    for i = 1:total_crossovers
        for j = 1:2
            spin = rand();
            selected_elmements = min(find(cumulative_percentuals >= spin))
            roulette(i,j) = selected_elmements
        end
        while roulette(i,1) == roulette(i,2)
            selected_elmements = min(find(cumulative_percentuals >= rand()))
            roulette(i,2) = selected_elmements
        end
    end
    selected = return(roulette);
endfunction