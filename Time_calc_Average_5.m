function Tim = Time_calc_Average_5(myCellArray)

numSets = numel(myCellArray);
data = 0;
Tim = cell(ceil(numSets/5),1); % initialize the array for storing the average of every 5 sets
idx = 1; % initialize the index of the new array

for i = 1:numSets
    data = data + myCellArray{1,i}{2};

    if mod(i, 5) == 0 % if 5 sets have been processed
        % calculate the average of the 5 sets and store it in the new array
        varname= myCellArray{1,i}{1};
        Tim{idx} = {varname,((data)/ 5)};
        idx = idx + 1;

        % reset the energy variables for the next 5 sets
        data = 0;
    end
end


end
