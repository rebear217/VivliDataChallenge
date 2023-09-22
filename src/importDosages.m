function dosages = importDosages(filename, dataLines)
%IMPORTFILE Import data from a text file
%  AMIKACIN = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the numeric data.
%
%  AMIKACIN = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
%  Amikacin = importfile("/Users/RobertBeardmore/Dropbox/EUCAST/Amikacin.csv", [1, 1]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 07-Oct-2022 15:16:40

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, 1];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 24);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Var1", "VarName2", "VarName3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "Var21", "Var22", "Var23", "Var24"];
opts.SelectedVariableNames = ["VarName2", "VarName3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20"];
opts.VariableTypes = ["string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "string", "string", "string", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var21", "Var22", "Var23", "Var24"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var21", "Var22", "Var23", "Var24"], "EmptyFieldRule", "auto");

% Import the data
dosages = readtable(filename, opts);

%% Convert to output type
dosages = table2array(dosages);
end