function [fire, transition] = tPe_DP_Move_pre(transition)


global global_info;
fire = 0;
if global_info.DP_Move_Btn ~= false,
    command = get(global_info.handles.DP_Move_Location,'String');
    global_info.DP_Move_Btn = false;
    if checkCommand_Move(command),
        transition.new_color = command;
        fire = 1;
    end
end

