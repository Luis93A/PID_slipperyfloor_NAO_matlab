function StabilityArray = Stab_calc(numVars,fold)
%com x y
StabilityArray = cell(1, numVars-1);
counter=1;

    folderName = fold;
    currentFolder = pwd;
    folder = fullfile(currentFolder, folderName);   % specify the path to the folder
    
files = dir(folder); % get a list of files and subdirectories in the folder
for i = 1:numel(files) % iterate through the list of files
    file = files(i);
    if file.isdir && ~ismember(file.name, {'.', '..'}) % check if the current file is a subdirectory
        subfolder = fullfile(folder, file.name); % get the full path to the subfolder
        subfolder_files = dir(subfolder); % get a list of files in the subfolder
        for j = 1:numel(subfolder_files)
            subfolder_file = subfolder_files(j);
            if ~subfolder_file.isdir % check if the current file is not a subdirectory
                % extract values of interest from the subfolder name using regular expressions
                subfolder_name = file.name;
                [~, subfolder_values] = regexp(subfolder_name, 'pid-(\d+\.\d+)', 'match', 'tokens');
                subfolder_values = str2double(subfolder_values{1});
                X_value = subfolder_values(1);
                X_value = round(X_value*100);
                varname = sprintf('zmp%d_%d', X_value, j-2);         % create a unique variable name for each subfolder
               
                % read the first line of the file to get the variable name
                T = readtable(fullfile(subfolder, subfolder_file.name));
                header = T.Properties.VariableNames{1};
                % load the rest of the file into a matrix
                data_table = T(1, 5:6);
                data = table2array(data_table);
                % assign the matrix to the variable with the name from the first line of the file
                eval([header '= data;']);
                % rename the variable to include values from the subfolder name
                eval(['data = ' header ';']);
                eval([varname '= data;']);
                StabilityArray{counter} = {varname, data};
                counter = counter + 1;
                clear data;
                if counter == numVars
                    break;
                end
            end
        end
        if counter == numVars
            break;
        end
    end
end


end