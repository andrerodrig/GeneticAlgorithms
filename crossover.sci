function descendants = crossover(parent_population, selected_matrix, n_separation)
    [n_cromossomos, n_genes] = size(parent_population)
    
    descend_matrix = zeros(n_cromossomos, n_genes);

    disp("População de pais");
    disp(parent_population);
    disp(descend_matrix);

    disp("selecionados");
    disp(selected_matrix);

    for i = 1:size(selected_matrix)(1)
        separation_point = grand(1, "uin", 1, n_genes - 1);
        if (i < n_cromossomos || modulo(n_cromossomos,2) == 0) then
            descend_matrix(2*i-1,:) = [...
                parent_population(selected_matrix(i,1), 1:separation_point),...
                parent_population(selected_matrix(i,2), (separation_point+1):$)...
            ]
            descend_matrix(2*i,:) = [...
                parent_population(selected_matrix(i,2), 1:separation_point),...
                parent_population(selected_matrix(i,1), (separation_point+1):$)...
            ]
        else
            descend_matrix(2*i-1,:) = [...
                parent_population(selected_matrix(i,1), 1:separation_point),...
                parent_population(selected_matrix(i,2), (separation_point+1):$)...
            ]
        end
    end

    descendants = descend_matrix

endfunction 