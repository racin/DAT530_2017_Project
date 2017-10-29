function [fire, transition] = tPe_TP_1_Move_pre(transition)

fire = 0;
global global_info;

[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.TP_1_Move_Btn ~= false && playerAction,
    global_info.TP_1_Move_Btn = false;
    disp('TP 1 move btn');
    dest = get(global_info.handles.FP_S_Move_Location,'String');
    amount = get(global_info.handles.FP_S_Move_Location,'String');
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