function h = grpHeatmap(data, grpVar, dataVar, option, figName, titleStr, varargin)
	
	S = load(fullfile("data", "colormaps.mat"));
	statarray = grpstats(data, grpVar, "mean", "DataVars", dataVar);
	figure("Name", figName+replace(option, " ", ""))
	if contains(titleStr, "red")
		heatmap(statarray, grpVar{1}, grpVar{2}, 'ColorVariable', "mean_"+dataVar, "ColorMethod", "none", 'Colormap', S.colormapRed)
	else
		h = heatmap(statarray, grpVar{1}, grpVar{2}, 'ColorVariable', "mean_"+dataVar, "ColorMethod", "none");
	end
	title(option+": "+titleStr) %+" "+dataVar
end