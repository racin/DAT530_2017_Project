function [fire, transition] = tTPe_1_Add_FaceUp_pre(transition)

fire = 0;
% Can only add FaceUp cards once the initial dealing is complete.
if length(tokIDs('pDP_Draw_FaceDown_Pile')) > 24 && (length(tokIDs('pTP_1_FaceDown_Pile')) + 1) < 7,
    print('Face up return');
    return;
end;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    [moveCmd, card] = splitCommand(get_color('pMC_Out_Buffer',moveToken));
    if(length(moveCmd) >= 2 && strcmp(moveCmd{2},'TP1')),
        disp('TP1: FACE UP trigger');
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
    end
end