function [fire, transition] = tPe_DP_Move_pre(transition)


global global_info;
fire = 0;
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.DP_Move_Btn ~= false && playerAction,
    global_info.DP_Move_Btn = false;
    dest = get_handle(global_info.handles.DP_Move_Location,'String');
    command = strcat('Move:',dest,':DP');    
    vistoken = tokenArrivedLate('pDP_Draw_FaceUp_Pile',1);
    if vistoken,
        color = get_color('pDP_Draw_FaceUp_Pile',vistoken);
        color = color{1};
        
        % By using the playerAction resource we ensure Atomic operations,
        % thus if there are more than 24 cards in the draw pile, we are
        % still doing initial dealing.
        % TODO: Check if this is neccesary!
        if length(tokIDs('pDP_Draw_FaceDown_Pile')) > 24  || checkCommand_Move({command;color},'',transition.name,global_info.handles.DP_ErrorMsg),
            transition.new_color = command;
            fire = 1;
        end;
    end;
end
