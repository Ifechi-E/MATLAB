AssetsMean= mean(assets12);
AssetsCovar= cov(assets12);

p= Portfolio();

p=Portfolio('AssetList',{'ANG','AST','BAR','LSG','MEG','SAG','SEG','SEV','TAY','TES','VOD','WPP'})
p= setAssetMoments(p, AssetsMean, AssetsCovar)
p= setDefaultConstraints(p)

plotFrontier(p)

%now that the efficient frontier has been drawn I will add ranodm
%portfolios 
hold on

N = size(assets12,2);                       % Use the 2nd dimension of size() to find the  number of columns 
                
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

hold off

estimateFrontier(p)                      % Generate a table of optimal portfolios on the efficient frontier

"equal weight portfolio"
p = setInitPort(p, 1/p.NumAssets)
[ersk, eret] = estimatePortMoments(p, p.InitPort)

[rsk, ret] = estimatePortMoments(p, estimateFrontierLimits(p))
disp(rsk)
disp(ret)