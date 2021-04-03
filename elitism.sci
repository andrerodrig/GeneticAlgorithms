function [new_generation, new_eval] = elitism(parent_pop, descend_pop, parent_eval, descend_eval, percentage)
    [prows, pcols] = size(parent_pop);
    new_pop = zeros(prows, pcols);
    new_evaluated_pop = zeros(prows, 1);

    [psorted_eval, pindex] = gsort(parent_eval);
    [dsorted_eval, dindex] = gsort(descend_eval);

    new_prows = ceil(percentage*prows)

    new_pop(1:new_prows,:) = parent_pop(1:new_prows,:);
    new_evaluated_pop(1:new_prows,:) = parent_eval(1:new_prows,:);

    new_pop((new_prows + 1):$,:) = descend_pop(1:(prows - new_prows),:);
    new_evaluated_pop((new_prows + 1):$,:) = descend_eval(1:(prows - new_prows),:)

    new_generation = new_pop;
    new_eval = new_evaluated_pop;
endfunction