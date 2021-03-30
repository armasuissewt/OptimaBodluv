function univarStats(data, grpVar, dataVar)
	statarray = grpstats(data, grpVar, "mean", "DataVars", dataVar); % = statsFromData(data, grpVar, dataVar);
	% disp(sortrows(statarray, "mean_InDeployedREDAIR"))
	bar(statarray.("mean_"+dataVar))
	ax = gca; ax.TickLabelInterpreter= "none";
	xticks(1:height(statarray))
	xticklabels(statarray.(grpVar))
	xlabel(grpVar)
	ylabel("mean "+dataVar)
	
	[G,TID] = findgroups(data.(grpVar));
	anova1(data.(dataVar), G);
	xticklabels(TID)
	ylabel(dataVar)
end