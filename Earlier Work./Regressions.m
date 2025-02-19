fitlm(MarketLag, Market);
RegResults=fitlm(MarketLag, Market);
RegExerciseResults1=fitlm(Market, VODAFONEGROUP);
RegExerciseResults1;

RegExerciseResults2=fitlm([Market, MarketLag], ANGLOAMERICAN)
