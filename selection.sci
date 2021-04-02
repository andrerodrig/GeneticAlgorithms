function [selected_matrix] = selection(evaluated_vect)
    
    // Função responsável por selecionar os indivíduos para recombinação genética.
    n_cromoss = size(evaluated_vect)(1);
    n_crossover = ceil(n_cromoss/2);
    roulette = zeros(n_crossover, 2);

    total_evaluations = sum(evaluated_vect);
    percentual_evaluations = evaluated_vect./total_evaluations
    distributed_percentual_evaluations = cumsum(percentual_evaluations);

    disp("Total de avaliações");
    disp(total_evaluations);

    disp("Avaliações Percentuais");
    disp(percentual_evaluations);

    disp("Avaliações Percentuais distribuidos de entre 0% a 100%");
    disp(distributed_percentual_evaluations);

    selected_matrix = spin_roulette(n_crossover, distributed_percentual_evaluations);

endfunction

function [selected] = spin_roulette(total_crossovers, cumulative_percentuals)
    roulette = zeros(total_crossovers, 2);
    for i = 1:total_crossovers
        for j = 1:2
            spin = rand();
            if (spin > cumulative_percentuals($-1)) then
                roulette(i,j) = find(cumulative_percentuals == cumulative_percentuals($))
            else
                selected_elmements = max(find(cumulative_percentuals <= spin))
                if (selected_elmements <> []) then
                    roulette(i,j) = selected_elmements
                else
                    roulette(i,j) = find(cumulative_percentuals(1))
                end
            end
        end
        while roulette(i,1) == roulette(i,2)
            selected_elmements = max(find(cumulative_percentuals <= rand()))
            if (selected_elmements <> []) then
                roulette(i,2) = selected_elmements
            else
                roulette(i,2) = find(cumulative_percentuals(1))
            end
        end
    end
    selected = return(roulette);
endfunction