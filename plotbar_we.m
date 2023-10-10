function plotbar_we(TE)
    % Extract variable names and values
    var_names = cell(size(TE));
    var_values = cell2mat(cellfun(@(x) x{2}, TE, 'UniformOutput', false));
    for i = 1:numel(TE)
        var_names{i} = TE{i}{1};
    end

    % Create bar plot
    bar(var_values)
    set(gca, 'XTickLabel', var_names)
    xlabel('Variable')
    ylabel('Value')
end