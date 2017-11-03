function [fire, transition] = pre_tTPe_Move_Multiple(transition)

global global_info;
fire = 0;

% TODO: Need to check if TP_Move_Multiple is triggered from this TP.
if global_info.TP_Move_Multiple ~= 0,
    if ~isempty(strfind(transition.name,num2str(global_info.TP_Move_Multiple))),
        disp('Move multiple trigger.');
        global_info.TP_Move_Multiple = 0;
        transition.new_color = global_info.TP_Move_LastCmd;
        transition.override = 1;
        fire = 1;
    end;
end;