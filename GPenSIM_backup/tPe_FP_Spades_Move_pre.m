function [fire, transition] = tPe_FP_Spades_Move_pre(transition)


global global_info;
fire = 0;
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.FP_S_Move_Btn ~= false && playerAction,
    global_info.FP_S_Move_Btn = false;
    disp('Spades move btn');
    dest = get_handle(global_info.handles.FP_S_Move_Location,'String');
    command = strcat('Move:',dest,':FPD');    
    vistoken = tokenArrivedLate('pFP_Spades_Pile',1);
    if vistoken,
        color = get_color('pFP_Spades_Pile',vistoken);
        color = color{1};
        if checkCommand_Move({command;color},'',transition.name,global_info.handles.FP_S_ErrorMsg),
            transition.new_color = command;
            fire = 1;
        end;
    end;
end