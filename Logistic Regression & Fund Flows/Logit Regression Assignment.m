Mydata = xlsread('AG432 Project Data.xlsx');

Dep = Mydata(:,2);

% dummies for redemption period
d1 = (Mydata(:,9)<=30); % short period
d2 = (Mydata(:,9)>30 & Mydata(:,9)<=45); % long period
%the smallest group of >45 have been left out of th emodel as to not run
%into the issue of multicolinearity where....

% define indp
Ind = [Mydata(:,3) Mydata(:,4) log(Mydata(:,5)) Mydata(:,6:8) d1 d2];
% AUM transformed to be logged what is the intuition 
            %to linearalise the relation between itself and dependent 

%% Estimate Model Parameters, Return Para, Stdd, TStat

[Para, stdd] = Logit(Dep, Ind);
%calclate t values
T_Value = Para./stdd;



