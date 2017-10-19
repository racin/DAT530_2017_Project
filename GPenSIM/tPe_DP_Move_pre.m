function [fire, transition] = tPe_DP_Move_pre(transition)


global global_info;
if global_info.DP_Move_Btn ~= false,
    transition.new_color = get(global_info.handles.DP_Move_Location,'String');
    global_info.DP_Move_Btn = false;
    fire = 1;
else
    fire = 0;
end

