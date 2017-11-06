function [fire, transition] = tPBe_DP_Turn_pre(transition)

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

[playerAction] = request(transition.name, {'playerAction', 1});
if strcmp(moveColor,'DP_Turn') && playerAction,
    disp('AI DP Turn clicked!');
    global_info.last_command_source = transition.name;
    transition.selected_tokens = moveToken;
    transition.override = 1;
    fire = 1;
end;