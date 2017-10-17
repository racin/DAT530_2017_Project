function [fire, transition] = tPe_DP_Move_pre(transition)


pause(0.01); % Halts execution in the main loop to allow to check for events.
global global_info;
if global_info.DP_Move_Btn ~= false,
    set(global_info.handles.DP_StatusMsg,'String',get(global_info.handles.DP_Move_Location,'String'));
    global_info.END_COLORS = get_current_colors();
    global_info.DP_Move_Btn = false;
else
    %disp(global_info.DP_Turn_Btn)
end

fire = 0;