load Project

% creating bar graph
figure('name','Bar');
bardata = [tab_neighc(:,2),tab_neighv(:,2)];
bardata = cell2mat(bardata);
bardata = sortrows(bardata);    %sorting numerically
bar(bardata);
xticks([]);
legend('Violent Crimes Committed in 2017','Vacant Buildings in 2017');
ylabel('Number per Neighborhood');