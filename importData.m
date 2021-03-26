function data = importData(sheetName, option)
	
	opts = spreadsheetImportOptions("NumVariables", 6);
	opts.Sheet = sheetName;
	opts.DataRange = "A2";
	opts.VariableNamesRange = "A1:F1";

	if sheetName ~= "blue_shot_costs"
		workbookFile = fullfile("data", "Detailed losses and kills 23032021.xlsx");
		opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "double", "double"];
	else
		workbookFile = fullfile("data", "system_kills_25_03_2021.xlsx");
		opts.VariableNames = ["Assessment"; "Scenario"; "BlueSystem"; "BlueEffector"; "RedTarget"; "Outcome"; "NumberOfShots"; "TotalRedLoss"; "TotalBlueCost"];
		opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "double", "double", "double"];
	end
	
	warning('off', 'MATLAB:table:ModifiedAndSavedVarnames')
	data = readtable(workbookFile, opts);
	
	data = data(~contains(string(data.Assessment), "bat"), :);
	if option ~=""
		data = data(string(data.Scenario) == option, :);
	end
% 	data{:, 3} = removecats(data{:, 3});
% 	data.BlueEffector = removecats(data.BlueEffector);
% 	data = data(contains(string(data.Assessment), "nighttime"), :);
	% data.InDeployedREDAIR = normrnd(0, 1, height(data), 1);
end