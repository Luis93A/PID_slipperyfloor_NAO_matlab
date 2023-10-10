function TE = Energy_calc_Average_5(myCellArray)

E1=0;E2=0;E3=0;E4=0;E5=0;E6=0;E7=0;E8=0;E9=0;E10=0;E11=0;E12=0;E13=0;E14=0;E15=0;E16=0;E17=0;E18=0;E19=0;E20=0;

numSets = numel(myCellArray);

TE = cell(ceil(numSets/5),1); % initialize the array for storing the average of every 5 sets
idx = 1; % initialize the index of the new array

for i = 1:numSets
    data = myCellArray{1,i}{2};
    
    %code for processing the data
    %torso
        Pt1 = data(:,3) .* data(:,1);
        Pt2 = data(:,4) .* data(:,2);
    %leftleg
        Pll1 = data(:,10) .* data(:,5);  
        Pll2 = data(:,11) .* data(:,6);
        Pll3 = data(:,12) .* data(:,7);
        Pll4 = data(:,13) .* data(:,8);
        Pll5 = data(:,14) .* data(:,9);
    %rightleg    
        Prl1 = data(:,20) .* data(:,15);
        Prl2 = data(:,21) .* data(:,16);
        Prl3 = data(:,22) .* data(:,17);
        Prl4 = data(:,23) .* data(:,18);
        Prl5 = data(:,24) .* data(:,19);
    %leftarm
        Pla1 = data(:,29) .* data(:,25);
        Pla2 = data(:,30) .* data(:,26);
        Pla3 = data(:,31) .* data(:,27);
        Pla4 = data(:,32) .* data(:,28);
    %rightarm
        Pra1 = data(:,37) .* data(:,33);
        Pra2 = data(:,38) .* data(:,34);
        Pra3 = data(:,39) .* data(:,35);
        Pra4 = data(:,40) .* data(:,36);
        
        T = 0:0.01:(size(Pt1,1)-1)/100;
        E1 = E1+ trapz(T, Pt1);
        E2 = E2+ trapz(T, Pt2);
        E3 = E3+ trapz(T, Pll1);
        E4 = E4+ trapz(T, Pll2);
        E5 = E5+ trapz(T, Pll3);
        E6 = E6+ trapz(T, Pll4);
        E7 = E7+ trapz(T, Pll5);
        E8 = E8 +trapz(T, Prl1);
        E9 = E9 +trapz(T, Prl2);
        E10 = E10+ trapz(T, Prl3);
        E11 = E11 +trapz(T, Prl4);
        E12 = E12+ trapz(T, Prl5);
        E13 = E13+ trapz(T, Pla1);
        E14 = E14+ trapz(T, Pla2);
        E15 = E15+ trapz(T, Pla3);
        E16 = E16+ trapz(T, Pla4);
        E17 = E17 +trapz(T, Pra1);
        E18 = E18+ trapz(T, Pra2);
        E19 = E19+ trapz(T, Pra3);
        E20 = E20+ trapz(T, Pra4);
        
        
    if mod(i, 5) == 0 % if 5 sets have been processed
        % calculate the average of the 5 sets and store it in the new array
        varname= myCellArray{1,i}{1};
        TE{idx} = {varname,((E1+E2+E3+E4+E5+E6+E7+E8+E9+E10+E11+E12+E13+E14+E15+E16+E17+E18+E19+E20) / 5)};
        idx = idx + 1;
        % reset the energy variables for the next 5 sets
        E1 = 0; E2 = 0; E3 = 0; E4 = 0; E5 = 0; E6 = 0; E7 = 0; E8 = 0; E9 = 0; E10 = 0;
        E11 = 0; E12 = 0; E13 = 0; E14 = 0; E15 = 0; E16 = 0; E17 = 0; E18 = 0; E19 = 0; E20 = 0;
    end
end


end
