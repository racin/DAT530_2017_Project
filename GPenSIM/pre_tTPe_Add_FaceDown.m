function [fire, transition] = pre_tTPe_Add_FaceDown(transition)

global global_info;
fire = 0;
[tableau, handle_err, move_btn, turn_btn, handle_move_loc, handle_move_amount] = get_tableau_num_from_transname(transition.name);
% Can only add FaceDown cards during the initial dealing.
if global_info.CARDS_DEALT >= global_info.INITIAL_DEAL_MOVE_LENGTH ...
    || length(tokIDs(strcat('pTP_',tableau,'_FaceDown_Pile'))) + 1 == str2double(tableau),
    disp('Face down return');
    return;
end;
moveToken = tokenArrivedEarly('pMC_Out_Buffer',1);
if moveToken,
    [moveCmd, card] = splitCommand(get_color('pMC_Out_Buffer',moveToken));
    if length(moveCmd) >= 2 && strcmp(moveCmd{2},strcat('TP',tableau)),
        disp(strcat('TP',tableau,': FACE down trigger'));
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
    end
end
