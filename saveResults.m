function saveResults(dataDir)
	%% Function for saving all figures and base workspace to date-specific directory
	path = fullfile(dataDir, "Results"); %, datestr(now, "yyyymmDDHHMMSS")
	mkdir(path)
	
	figHandles = get(groot, 'Children');
	
	for iFig = 1:numel(figHandles)
% 		filename = fullfile(path, "figure"+figHandles(iFig).Number);
		filename = fullfile(path, figHandles(iFig).Name);
		figHandles(iFig).WindowState = "maximized";
% 		savefig(figHandles(iFig), filename)
		if verLessThan('matlab', '9.8')
			print(figHandles(iFig), filename,'-djpeg')
		else
			exportgraphics(figHandles(iFig), filename+".jpg") % From R2020a
		end
	end 
    
end