function [fire, transition] = pre_tTPe_Add_FaceDown(transition)

global global_info;
fire = 0;
[tableau, ~, ~, ~, ~, ~] = get_tableau_num_from_transname(transition.name);
% Can only add FaceDown cards during the initial dealing.
if global_info.CARDS_DEALT >= global_info.INITIAL_DEAL_MOVE_LENGTH ...
    || length(tokIDs(strcat('pTP_',tableau,'_FaceDown_Pile'))) + 1 == str2double(tableau),
    return;
end;
moveToken = tokenArrivedEarly('pMC_Out_Buffer',1);
if moveToken,
    [moveCmd, card] = splitCommand(get_color('pMC_Out_Buffer',moveToken));
    if length(moveCmd) >= 2 && strcmp(moveCmd{2},strcat('TP',tableau)),
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
        if(global_info.DISP_CHANGES),
            disp(strcat('Moved card',{' '},card,{' '},'from DP',{' '},...
                'to',{' '},moveCmd{2},{' '},'(FD)'));
        end;
    end
end
