function weighted_values = plotR(array1,array2,array3,array4,array5,array6,w1,w2,w3,w4,w5,w6)


% Loop through each of the arrays and calculate the weighted values
for i = 1:size(array1)
    weighted_values = w1*array1{i,1}{1,2} + w2*array2{i,1}{1,2} + w3*array3{i,1}{1,2} + w4*array4{i,1}{1,2}+ w5*array5{i,1}{1,2} + w6*array6{i,1}{1,2};
    name = array1{i}{1};
    normalized_cell_array{i} = {name, weighted_values};
end

% plot bar chart of normalized values with names as x-tick labels
weighted_values = cellfun(@(x) x{2}, normalized_cell_array, 'UniformOutput', false);
weighted_values = cell2mat(weighted_values);
bar(weighted_values);
xticklabels(cellfun(@(x) x{1}, normalized_cell_array, 'UniformOutput', false));

end