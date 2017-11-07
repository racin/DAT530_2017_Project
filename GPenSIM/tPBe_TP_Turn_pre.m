function [fire, transition] = tPBe_TP_Turn_pre(transition)

global global_info;
fire = 0;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;
moveToken = tokenArrivedLate('pPB_Cmd', 1);
if isempty(moveToken),
    return;
end;

moveColor = get_color('pPB_Cmd', moveToken);
moveColor = moveColor{1};

[playerAction] = request(transition.name, {'playerAction', 1});
if ~isempty(strfind(moveColor,'TP_Turn')) && playerAction,
    
    cmd_split = strsplit(moveColor,':');
    tableau = cmd_split{2};
    if ~isempty(tokIDs(strcat('pTP_',tableau,'_FaceUp_Pile'))) || ...
            isempty(tokIDs(strcat('pTP_',tableau,'_FaceDown_Pile'))),
        
        global_info.BOT_ACTIONS_NEW_CMD = 1;
        return;
    end;
    
    command = strcat('Turn:TP',tableau);
    
    global_info.last_command_source = transition.name;
    transition.selected_tokens = moveToken;
    transition.new_color = command;
    transition.override = 1;
    fire = 1;
    return;
end;