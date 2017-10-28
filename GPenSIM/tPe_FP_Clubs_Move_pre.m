function [fire, transition] = tPe_FP_Clubs_Move_pre(transition)


global global_info;
fire = 0;
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.FP_C_Move_Btn ~= false && playerAction,
    disp('Clubs move btn');
    dest = get(global_info.handles.FP_C_Move_Location,'String');
    command = strcat('Move:',dest,':FPC');    
    vistoken = tokenArrivedLate('pFP_Clubs_Pile',1);
    if vistoken,
        color = get_color('pFP_Clubs_Pile',vistoken);
        color = color{1};
        if checkCommand_Move({command;color},'',transition.name,global_info.handles.FP_C_ErrorMsg),
            transition.new_color = command;
            fire = 1;
        end;
    end;
end
global_info.FP_C_Move_Btn = false;

