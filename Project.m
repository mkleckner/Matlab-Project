% Mitchell Kleckner and Daniel Nguyen

% import violent crime and vacant building data by neighborhood
[numbsv namesv datav] = xlsread('Vacant_Buildings_Data.xlsx');
[numbsc namesc datac] = xlsread('Violent_Crime_2017.xlsx');

% create vectors with the neighborhoods from each array for future analysis
neighv = datav(:,2);
neighc = datac(:,2);

% create an array with the name of each unique neighborhood, the number of
% occurrences within the respective arrays, and the percentage out of total
% occurrence
tneighv = tabulate(neighv);
tneighc = tabulate(neighc);
