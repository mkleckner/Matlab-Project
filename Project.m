% Mitchell Kleckner and Daniel Nguyen

% Import violent crime and vacant building data by neighborhood. Each entry
% is an occurrance of a violent crime or a vacant building
[~, ~, datav] = xlsread('Vacant_Buildings_Data.xlsx');
[~, ~, datac] = xlsread('Violent_Crime_2017.xlsx');

% isolate neighborhood names and put them in a new matrix
neighv = datav(:,2);
neighc = datac(:,2);

% As our data is currently stored the number of occurrances, tabulate() was
% used to count the number of occurrances per neighborhood, then create a
% new matrix for each containing the names of each neighborhood, the number
% of occurrances, and the percentage of occurrances.
tab_neighv = tabulate(neighv);
tab_neighc = tabulate(neighc);

% Removing neighborhoods that do not occur in both datasets
tab_neighv_names = string(tab_neighv(:,1)); %pulling out neighborhoods and putting in new variable
tab_neighc_names = string(tab_neighc(:,1));

ismem_data = ismember(tab_neighv_names,tab_neighc_names);   % making logical array comparing neighborhoods crimes and vacancy data (true if found in both)
for i=1:219     % NaN for any values from tab_neighv that are not in tab_neighv_names and tab_neighc_names
    x=ismem_data(i,1);
    x=ismem_data(i,1);
    if x==0
        tab_neighv{i,1} = nan;
        tab_neighv{i,2} = nan;
        tab_neighv{i,3} = nan;
    end
end

ismem_data = ismember(tab_neighc_names,tab_neighv_names);
for i=1:277     % NaN for any values from tab_neighc that are not in tab_neighv_names and tab_neighc_names
    x=ismem_data(i,1);
    if x==0
        tab_neighc{i,1} = nan;
        tab_neighc{i,2} = nan;
        tab_neighc{i,3} = nan;
    end
end

clear x i ismem_data

% remove missing values from matrices left over from previous step
tab_neighc(any(cellfun(@(i) any(isnan(i)),tab_neighc),2),:) = [];
tab_neighv(any(cellfun(@(i) any(isnan(i)),tab_neighv),2),:) = [];

% alphabetize
tab_neighc = sortrows(tab_neighc);
tab_neighv = sortrows(tab_neighv);

% export variables for later use
save('Project', 'tab_neighc', 'tab_neighv');