function [fire, transition] = tTPe_1_Add_FaceDown_pre(transition)

fire = 0;
tpnum = 7;
% Can only add FaceDown cards during the initial dealing.
if (length(tokIDs('pDP_Draw_FaceDown_Pile')+length(tokIDs('pDP_Draw_FaceUp_Pile')))) <= 24 || (length(tokIDs('pTP_1_FaceDown_Pile')) + 1) == tpnum,
    disp('Face down return');
    return;
end;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    [moveCmd, card] = splitCommand(get_color('pMC_Out_Buffer',moveToken));
    if(length(moveCmd) >= 2 && strcmp(moveCmd{2},'TP1')),
        disp('TP1: FACE down trigger');
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
    end
end
