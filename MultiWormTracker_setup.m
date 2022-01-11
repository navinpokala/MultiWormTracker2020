function MultiWormTracker_setup

global SCOPE_NUMBER;
if(isempty(SCOPE_NUMBER))
    SCOPE_NUMBER = [];
end

MultiWormTracker_CODE_PATH = '\\Mac\Home\Documents\MATLAB_Python\demo\MultiWormTracker_2020';

if(ismac)
    MultiWormTracker_CODE_PATH = '/Users/npokala/Documents/MATLAB_Python/demo/MultiWormTracker_2020';
end

restoredefaultpath;

addpath(genpath(MultiWormTracker_CODE_PATH));

regionprops_path = sprintf('%s%simage_processing%scustom_regionprops%s',MultiWormTracker_CODE_PATH,filesep,filesep,filesep);

% remove the custom_regionprops from the path
path_to_del = sprintf('%scustom_regionprops',regionprops_path);
rmpath(path_to_del);
path_to_del = sprintf('%scustom_regionprops_R14',regionprops_path);
rmpath(path_to_del);
path_to_del = sprintf('%scustom_regionprops_32_2011',regionprops_path);
rmpath(path_to_del);
path_to_del = sprintf('%scustom_regionprops_64',regionprops_path);
rmpath(path_to_del);
path_to_del = sprintf('%scustom_regionprops_default',regionprops_path);
rmpath(path_to_del);

% for Windows 32-bit
if(~isempty((findstr(mexext,'32'))) && ~isempty((findstr(version('-release'),'2011'))))
    new_custom_regionprops = sprintf('%scustom_regionprops_32_2011',regionprops_path);
    addpath(new_custom_regionprops);
    return
end

% for windows 64-bit
if(~isempty((findstr(mexext,'64'))))
    new_custom_regionprops = sprintf('%scustom_regionprops_64',regionprops_path);
    addpath(new_custom_regionprops);
    return
end

% other version
new_custom_regionprops = sprintf('%scustom_regionprops_default',regionprops_path);
addpath(new_custom_regionprops);

return;
end

