function [fire, transition] = tPBe_TP_Turn_pre(transition)

global global_info;
fire = 0;
global_info.BOT_ACTIONS_NEW_CMD = 1;
return;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;
moveToken = tokenArrivedLate('pPB_Cmd', 1);
if ~moveToken,
    return;
end;
moveColor = get_color('pPB_Cmd', moveToken);

[playerAction] = request(transition.name, {'playerAction', 1});
if ~isempty(strfind(moveColor,'TP_Turn')) && playerAction,
    
    vistoken = tokenArrivedLate('pDP_Draw_FaceUp_Pile',1);
    if ~vistoken,
        global_info.BOT_ACTIONS_NEW_CMD = 1;
        return;
    end;
    moveTo = randi(movesLeft);
    dest = global_info.BOT_DP_MOVES{moveTo};
    disp('AI DP MOVE clicked!');
    command = strcat('Move:',dest,':DP');
    disp(command);
    color = get_color('pDP_Draw_FaceUp_Pile',vistoken);
    color = color{1};
    if checkCommand_Move({command;color},'',transition.name,'DP_ErrorMsg'),
        transition.selected_tokens = moveToken;
        transition.new_color = command;
        transition.override = 1;
        fire = 1;
        return;
    end;
    global_info.BOT_DP_MOVES(moveTo) = [];
end;