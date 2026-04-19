function C = readJpmExcel(fn)
% READJPMEXCEL Read arranged hydrophone Excel data with measured Qs/Ds.
%
%   C = readJpmExcel()
%   C = readJpmExcel(fn)
%
% If no file is provided, the function reads the first `*arranged.xlsx`
% workbook under `hydrophone-gp/data/raw`.

if nargin < 1 || strlength(string(fn)) == 0
    project_root = fileparts(fileparts(fileparts(mfilename("fullpath"))));
    candidates = dir(fullfile(project_root, "data", "raw", "*arranged.xlsx"));
    assert(~isempty(candidates), "No arranged workbook found in data/raw.");
    fn = fullfile(candidates(1).folder, candidates(1).name);
end

opts = spreadsheetImportOptions("NumVariables", 13);
opts.Sheet = "メインデータ";
opts.DataRange = [2, Inf];
opts.VariableNames = ["date", "Qs", "Ds", ...
                      "ips10", "ips9", "ips8", "ips7", "ips6", ...
                      "ips5", "ips4", "ips3", "ips2", "ips1"];
opts.VariableTypes = ["datetime", "double", "double", ...
                      "double", "double", "double", "double", "double", ...
                      "double", "double", "double", "double", "double"];

C = readtable(fn, opts, "UseExcel", false);
end
