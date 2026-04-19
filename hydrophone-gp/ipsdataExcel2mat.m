function C = ipsdataExcel2mat(fn, out, mode)
% IPSDATAEXCEL2MAT Convert hydrophone Excel data to the project's MAT format.
%
%   C = ipsdataExcel2mat(fn, out)
%   C = ipsdataExcel2mat(fn, out, mode)
%
% Supported modes:
%   "pulse_only" - Excel contains date + ips10:ips1 only.
%                  Qs and Ds are added as NaN.
%   "measured"   - Excel already contains date, Qs, Ds, ips10:ips1.
%
% The default is "pulse_only" to preserve the behavior of the legacy
% top-level function that was used for pulse-only source files.

if nargin < 3 || isempty(mode)
    mode = "pulse_only";
end

mode = lower(string(mode));
switch mode
    case "pulse_only"
        C = importPulseOnlyExcel(fn);
    case "measured"
        C = importMeasuredExcel(fn);
    otherwise
        error("Unsupported mode '%s'. Use 'pulse_only' or 'measured'.", mode);
end

save(out, "C");
end

function C = importPulseOnlyExcel(fn)
opts = spreadsheetImportOptions("NumVariables", 11);
opts.DataRange = [4, Inf];
opts.VariableNames = ["date", ...
                      "ips10", "ips9", "ips8", "ips7", "ips6", ...
                      "ips5", "ips4", "ips3", "ips2", "ips1"];
opts.VariableTypes = ["datetime", ...
                      "double", "double", "double", "double", "double", ...
                      "double", "double", "double", "double", "double"];

C = readtable(fn, opts, "UseExcel", false);
C.Qs = NaN(height(C), 1);
C.Ds = NaN(height(C), 1);
C = movevars(C, ["Qs", "Ds"], "After", "date");
end

function C = importMeasuredExcel(fn)
opts = spreadsheetImportOptions("NumVariables", 13);
opts.DataRange = [2, Inf];
opts.VariableNames = ["date", "Qs", "Ds", ...
                      "ips10", "ips9", "ips8", "ips7", "ips6", ...
                      "ips5", "ips4", "ips3", "ips2", "ips1"];
opts.VariableTypes = ["datetime", "double", "double", ...
                      "double", "double", "double", "double", "double", ...
                      "double", "double", "double", "double", "double"];

C = readtable(fn, opts, "UseExcel", false);
end
