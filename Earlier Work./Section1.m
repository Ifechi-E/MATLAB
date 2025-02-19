Europe= xlsread("Relevant For group project.xlsx",'O2:O121');
RealTBill= xlsread("Relevant For group project.xlsx",'N2:N121');
[Returns,Names]= xlsread("Relevant For group project.xlsx",'B1:K121');
Names= Names';

plot(Dates, Returns(:,i))

for i=1:N;
    
