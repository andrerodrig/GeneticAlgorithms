clear
clc

exec("evaluation.sci", -1);
exec("selection.sci", -1);
exec("crossover.sci", -1);
exec("mutation.sci", -1);
exec("elitism.sci", -1);

disp("-------------Algorítmo Genético-----------")
len_population = 6;
n_genes = 8;

function eval_f = eval_function(x)
    eval_f = return((x.^2).*cos(2.5*x).*exp(-x));
endfunction

function population = init_population(population_size, gen_number)
    // Generates a random population based on a seed
    seed = 666;
    grand("setsd", seed);
    population = return(grand(population_size, gen_number, "uin", 0, 1));
endfunction


population = init_population(len_population, n_genes);
disp("População")
disp(population);

evaluated = evaluation(population, eval_function);

selected_matrix = selection(evaluated);
disp("Indivíduos Selecionados");
disp(selected_matrix);

descendants = crossover(population, selected_matrix, 1);
disp("Descendentes");
disp(descendants);

new_descnendants = mutation(descendants, 0.2, 0.1);
disp("Descendentes apos processo de mutação");
disp(new_descendants);

evaluated_parent = evaluated;
disp("Avaliação dos pais");
disp(evaluated_parent);

evaluated_descend = evaluation(new_descendants,eval_function);
disp("Avaliação dos descendentes");
disp(evaluated_descend);

integrated_individuals = 0.3;

[new_population, new_eval] = elitism(population,new_descendants, evaluated_parent, evaluated_descend, integrated_individuals);

disp("Nova geração de pais");
disp(new_population);

disp("Avaliação dos novos pais");
disp(new_eval);
