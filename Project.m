% Mitchell Kleckner and Daniel Nguyen


[numbsv namesv datav] = xlsread('Vacant_Buildings.xlsx');
[numbsc namesc datac] = xlsread('BPD_Part_1_Victim_Based_Crime_Data.xlsx');

neighv = datav(:,1);
neighc = datac(:,1);

uniqueneighv = unique(neighv);
uniqueneighc = unique(neighc);

X = repmat(neighv,length(uniqueneighv),1);
