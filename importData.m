function data = importData(sheetName, option, varargin)
	
	opts = spreadsheetImportOptions("NumVariables", 6);
	opts.Sheet = sheetName;
	opts.DataRange = "A2";
	opts.VariableNamesRange = "A1:F1";

	if nargin == 3
		workbookFile = varargin{1};
	end
	if sheetName == "red_shot_costs"
		opts.VariableNames = ["Assessment"; "Scenario"; "RedSystem"; "RedEffector"; "BlueTarget"; "Outcome"; "ShooterLocation"; "NumberOfShots"; "TotalBlueLoss"; "TotalRedCost"];
		opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "double", "double", "double"];
	elseif sheetName == "blue_killed_by_red_system"
% 		workbookFile = fullfile("data", "system_kills_31_03_2021.xlsx");
% 		workbookFile = fullfile("data", "indirect_ext_bodluv_09_07_2021", "system_kills_Indirect Ext GR vs Rgt Heavy BODLUV.xlsx");
		workbookFile = fullfile("data", "indirect_ext_bodluv_09_07_2021", "system_kills_Indirect Ext NO GR vs Rgt Heavy BODLUV.xlsx");
		opts.VariableNames = ["Assessment"; "Scenario"; "RedSystem"; "BlueSystem"; "ShooterLocation"; "Absolute"; "DeployedBlue"];
		opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "categorical", "double", "double"];
	elseif sheetName ~= "blue_shot_costs"
% 		workbookFile = fullfile("data", "Detailed losses and kills 23032021.xlsx");
% 		opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "double", "double"];
% 		workbookFile = fullfile("data", "system_kills_Indirect Ext GR vs Rgt Heavy BODLUV_05_07_2021.xlsx");
		workbookFile = fullfile("data", "system_kills_Indirect Ext NO GR vs Rgt Heavy BODLUV_05_07_2021.xlsx");
		opts.VariableNames = ["Assessment"; "Scenario"; "BlueEffector"; "RedSystem"; "TargetLocation"; "Absolute"; "InDeployedREDAIR"];
		opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "categorical", "double", "double"];
	else
		workbookFile = fullfile("data", "system_kills_25_03_2021.xlsx");
		opts.VariableNames = ["Assessment"; "Scenario"; "BlueSystem"; "BlueEffector"; "RedTarget"; "Outcome"; "NumberOfShots"; "TotalRedLoss"; "TotalBlueCost"];
		opts.VariableTypes = ["categorical", "categorical", "categorical", "categorical", "categorical", "categorical", "double", "double", "double"];
	end
	
	warning('off', 'MATLAB:table:ModifiedAndSavedVarnames')
	data = readtable(workbookFile, opts);
	
	data = data(~contains(string(data.Assessment), "bat"), :);
	if option ~="All options"
		data = data(string(data.Scenario) == option, :);
	end
	
	for iColumn = 1:size(data, 2)
		if iscategorical(data{1, iColumn})
			varName = data.Properties.VariableNames{iColumn};
			data.(varName) = replace(string(data.(varName)), "_", "-");
		end
	end
	
% 	data{:, 3} = removecats(data{:, 3});
% 	data.BlueEffector = removecats(data.BlueEffector);
% 	data = data(contains(string(data.Assessment), "nighttime"), :);
	% data.InDeployedREDAIR = normrnd(0, 1, height(data), 1);
end