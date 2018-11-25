load Project

crime_s = cell2mat(tab_neighc(:,2));
vacancy_s = cell2mat(tab_neighv(:,2));

% linear regression
line = polyfit(crime_s,vacancy_s,1);

% plotting
figure('name','Scatter');
hold on
sym_line = @(a) (a(1)*sym('x')+a(2)); % defining anonymous function to extract coefficients from linear polyfit and make a symbolic line for plotting
scatter(crime_s,vacancy_s,'.');
lobf = sym_line(line);
for i=0.1:50:1600 % animating the line of best fit by symbolically plotting it with incrementally changing bounds
    fplot(lobf,[0,i]);
    pause(.0000001);
end
xlabel('Vacancies in 2017');
ylabel('Violent Crimes Committed in 2017');
legend('Neighborhood','y=0.2231x+16.6531');