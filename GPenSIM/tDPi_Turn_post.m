function [] = tDPi_Turn_post(transition)

global global_info;

% Release playerAction resource to allow for another player action.
if isfield(global_info,'last_command_source'),
    release(global_info.last_command_source);
end;