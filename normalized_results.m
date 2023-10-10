function normalized_cell_array = normalized_results(original_cell_array)

% get maximum value for normalization
values = cellfun(@(x) x{2}, original_cell_array, 'UniformOutput', false);
values = cell2mat(values);
max_value = max(values(:));

% create new nx1 cell array to store normalized values with names
normalized_cell_array = cell(size(original_cell_array));

% loop over original cell array, normalize values, and store in new cell array with names
for i = 1:numel(original_cell_array)
    name = original_cell_array{i}{1};
    value = original_cell_array{i}{2};
    normalized_value = value/max_value;
    normalized_cell_array{i} = {name, normalized_value};
end

% plot bar chart of normalized values with names as x-tick labels
normalized_values = cellfun(@(x) x{2}, normalized_cell_array, 'UniformOutput', false);
normalized_values = cell2mat(normalized_values);
bar(normalized_values);
xticklabels(cellfun(@(x) x{1}, normalized_cell_array, 'UniformOutput', false));
end


