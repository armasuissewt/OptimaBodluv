function h = grpHeatmap(data, grpVar, dataVar, option, figName, titleStr, varargin)
	statarray = grpstats(data, grpVar, "mean", "DataVars", dataVar);
	figure("Name", figName+replace(option, " ", ""))
	if nargin == 7
		heatmap(statarray, grpVar{1}, grpVar{2}, 'ColorVariable', "mean_"+dataVar, "ColorMethod", "none", 'Colormap', varargin{1}.Colormap(:, [3, 1, 2]), 'CellLabelFormat', '%0.2g')
	else
		h = heatmap(statarray, grpVar{1}, grpVar{2}, 'ColorVariable', "mean_"+dataVar, "ColorMethod", "none");
	end
	title(option+": "+titleStr) %+" "+dataVar
end