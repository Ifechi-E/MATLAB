Europe= xlsread("Relevant For group project.xlsx",'O2:O121');
RealTBill= xlsread("Relevant For group project.xlsx",'N2:N121');
[Returns,Names]= xlsread("Relevant For group project.xlsx",'B1:K121');
Names= Names';

%using Europe as market return, Calculating the excess market return
EuropeExcessReturn= Europe-RealTBill;

%multi-regress assets with world excess returns (world excess returns on x axis)
N=10;  
alpha=[];        
beta=[]; 
Std=[];
alphatst=[]; 
betatst=[];
p=[];             
rsq=[];  

for i=1:N;         
    mdl=fitlm(EuropeExcessReturn,Returns(:,i));
    alpha=[alpha;mdl.Coefficients.Estimate(1)]; 
    beta=[beta;mdl.Coefficients.Estimate(2)];  
    Std=[Std;mdl.Coefficients.SE(1)];
    alphatst=[alphatst;mdl.Coefficients.tStat(1)];    
    betatst=[betatst;mdl.Coefficients.tStat(2)];    
    p=[p;mdl.Coefficients.pValue(1)];         
    rsq=[rsq;mdl.Rsquared.Ordinary];     
end;
disp('Country Excess Return Alphas Table With European Equity Index as Market')
Q3A=table(Names,alpha,alphatst,beta,betatst,Std,p,rsq);
disp(Q3A)

%Does the 0 alpha null hypothesis hold?
[h,p,ci,stats]=ttest((Q3A{:,{'alpha'}}))