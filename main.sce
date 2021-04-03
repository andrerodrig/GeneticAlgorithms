clear
//clc

exec("evaluation.sci", -1);
exec("selection.sci", -1);
exec("crossover.sci", -1);


len_population = 5;
n_genes = 5;

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

disp("Valores avaliados");
disp(evaluated);

selected_matrix = selection(evaluated);
disp("Indivíduos Selecionados");
disp(selected_matrix);

descendants = crossover(population, selected_matrix, 1);
disp("Descendentes");
disp(descendants);