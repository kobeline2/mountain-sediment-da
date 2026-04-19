% Copy this file to local_paths.m and update the path for your machine
% only if you want to override the bundled default.
if ~exist('project_root', 'var')
    project_root = fileparts(fileparts(mfilename('fullpath')));
end
PATH_GPML_STARTUP = fullfile(project_root, 'vendor', 'gpml', 'startup.m');
