function evaluated = evaluation(population, eval_function)

    [rows, cols] = size(population);
    eval_values = [];
    for i = 1:rows
        real_value = binary_to_real(population(i,:), 0, 10);
        eval_values(i) = eval_function(real_value);
    end
    [evaluated] =  exp(-eval_values);
endfunction

function decimal_value = binary_to_decimal(bin)
    dec = 0
    for i = 1:size(bin)(2)
        dec = dec + sum(bin(size(bin)(2) - (i - 1))*2^(i-1));
    end
    decimal_value = return(dec)
endfunction

function real_value = binary_to_real(bin, min_val, max_val)
    N = length(bin)
    dec = binary_to_decimal(bin)
    real_value = return((dec * (max_val - min_val))/(2^N - 1) + min_val)
endfunction
