function [fire, transition] = tPBe_FP_Move_pre(transition)

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
if ~isempty(strfind(moveColor,'FP_Move')) && playerAction,
    movesLeft = length(global_info.BOT_FP_MOVES);
    if movesLeft == 0,
        global_info.BOT_ACTIONS_NEW_CMD = 1;
        return;
    end
    cmd_split = strsplit(moveColor,':');
    suit_abbr = cmd_split{2};
    global_suit = global_info.SUITS.(suit_abbr);
    vistoken = tokenArrivedLate(strcat('pFP_',global_suit{1},'_Pile'),1);
    if ~vistoken,
        global_info.BOT_ACTIONS_NEW_CMD = 1;
        return;
    end;
    moveTo = randi(movesLeft);
    dest = global_info.BOT_FP_MOVES{moveTo};
    
    command = strcat('Move:',dest,strcat(':FP',suit_abbr));
    
    color = get_color(strcat('pFP_',global_suit{1},'_Pile'),vistoken);
    color = color{1};
    if checkCommand_Move({command;color},'',transition.name,strcat('FP_',suit_abbr,'_ErrorMsg')),
        transition.selected_tokens = moveToken;
        transition.new_color = command;
        transition.override = 1;
        fire = 1;
        return;
    end;
    global_info.BOT_FP_MOVES(moveTo) = [];
end;