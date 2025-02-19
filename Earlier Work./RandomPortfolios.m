AssetMean=mean(assets12)
AssetCovar=cov(assets12)

p=Portfolio('AssetList',{'ANG','AST','BAR','LSG','MEG','SAG','SEG','SEV','TAY','TES','VOD','WPP'})

p=setAssetMoments(p,AssetMean,AssetCovar)
p=setDefaultConstraints(p)

plotFrontier(p);


%Random Portfolios
N = size(assets12,2);                    % Use the 2nd dimension of size() to find the  number of columns 
                
am1 = mean(assets12,1);                  % Find the mean of each column 
covar = cov(assets12);                   % Find the covariance 


w=exprnd(1,1000,N);                      % Creates a 1000xN matrix of random numbers from an exponential distribution with mean 1 


tot = sum(w,2);                          % Sum across the columns of the weights matrix 
tot = tot(:,ones(N,1));                  % Turns the 1000x1 vector into a matrix with 7 identical columns 
w = w./tot;                              % Divide the weights matrix by the totals matrix 

[pRisk , pRet] = portstats(am1,covar,w); % Calculate the Expected portfolio risks & returns 

hold on                                  % Add to existing plot 
plot(pRisk,pRet,'.r')                  % Plots each of the risk/return points as a red dot 
title('Mean-Variance Efficient Frontier and Random Portfolios') % Change the title 
hold off;                                % Stop adding to chart 

estimateFrontier(p)                      % Generate a table of optimal portfolios on the efficient frontier


% GMV Porfolio
"GMV portfolio"
iota=ones(size(AssetCovar,1),1) 
w_GMV=(inv(AssetCovar)*iota)/(iota'*inv(AssetCovar)*iota)   %minimisation function to fi


% Equally Weighted Portfolio
 p = setInitPort(p, 1/p.NumAssets) 
 [ersk, eret] = estimatePortMoments(p, p.InitPort)


%Range of Risk and Return
'Displaying Frontier range of risk and returns'
[rsk, ret] = estimatePortMoments(p, estimateFrontierLimits(p))

disp(rsk)
disp(ret)


%Target Portfolio Risk & Return
 TargetReturn = 0.015 
 TargetRisk = 0.11                      % setting the targets

 awgt = estimateFrontierByReturn(p, TargetReturn) 
 [arsk, aret] = estimatePortMoments(p, awgt)
 bwgt = estimateFrontierByRisk(p, TargetRisk) 
 [brsk, bret] = estimatePortMoments(p, bwgt)

 %plotting portfolios
 plotFrontier(p) 
 
 hold on 
 plot(0.034, 0.0099,'*r')               % red asterisk 
 plot(arsk, aret, 'sy')                 % yellow square 
 plot(brsk, bret, 'dk')                 % black diamond
 title('Efficient Frontier and Selected Portfolios')
 hold off

