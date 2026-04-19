% Copy this file to parameters.m and edit as needed.
%
% 01:date
% 02:Qs m^2/s
% 03:Ds mm
% 04:ips10,05:ips9, 06:ips8, 07:ips7, 08:ips6,
% 09:ips5, 10:ips4, 11:ips3, 12:ips2, 13:ips1

if ~exist('project_root', 'var')
    project_root = fileparts(fileparts(mfilename('fullpath')));
end

Param = struct();

% Training data or pre-exported training snapshot.
Param.Data = fullfile(project_root, 'models', 'trained', '240123sato', 'Data.mat');
Param.logy = true;
Param.isused = [1:2040, 2160:5987];
Param.yindex = 2; % 2:Qs, 3:Ds
Param.Xindex = 4:13;

% Prediction
Param.isprediction = true;
Param.outputExcel = true;
Param.outputExcelPath = fullfile(project_root, 'outputs', 'predictions', ...
                                 '20180625_predicted.xlsx');
Param.hyp = fullfile(project_root, 'models', 'trained', '240123sato', 'h.mat');
Param.predictData = fullfile(project_root, 'data', 'processed', '20180625.mat');
Param.ParamNorm = fullfile(project_root, 'models', 'trained', '240123sato', ...
                           'ParamNorm.mat');

Param.D = length(Param.Xindex); % dim of the data

% Preprocessing
Param.coefLog = 5.0505e-06; % value to convert the minimum data to 1
Param.normMethod = "scale";
Param.seedPartition = 12345; % 'r' or integer
Param.pPartition = 0.7; % train data rate

% Model type
Param.modelval = 'gpval';
Param.modelfit = 'gpfit';

% GP
Param.maxIters = 3000;
Param.seedGP = 1234; % 'r' or integer
