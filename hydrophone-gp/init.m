% hydrophone-gp startup script
% reads configs/local_paths.m and adds project paths

if ~exist('project_root', 'var')
    project_root = fileparts(mfilename('fullpath'));
end

local_paths_file = fullfile(project_root, 'configs', 'local_paths.m');
if ~isfile(local_paths_file)
    local_paths_file = fullfile(project_root, 'configs', 'local_paths.sample.m');
end
run(local_paths_file)
addpath(project_root);
addpath(fullfile(project_root, 'src'));
addpath(fullfile(project_root, 'src', 'utils'));
addpath(fullfile(project_root, 'src', 'models'));
addpath(fullfile(project_root, 'src', 'postprocessing'));
addpath(fullfile(project_root, 'src', 'preprocessing'));

% Start GPML toolbox from the local machine-specific path.
run(PATH_GPML_STARTUP)
clear PATH_GPML_STARTUP
