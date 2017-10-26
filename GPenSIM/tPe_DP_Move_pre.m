function [fire, transition] = tPe_DP_Move_pre(transition)


global global_info;
fire = 0;
if global_info.DP_Move_Btn ~= false,
    command = strcat('Move:',get(global_info.handles.DP_Move_Location,'String'),':DP');
    global_info.DP_Move_Btn = false;
    vistoken = tokenArrivedLate('pDP_Draw_FaceUp_Pile',1);
    if vistoken,
        color = get_color('pDP_Draw_FaceUp_Pile',vistoken);
        color = color{1};
        if checkCommand_Move({command;color},''),
            transition.new_color = command;
            fire = 1;
        end;
    end;
end

