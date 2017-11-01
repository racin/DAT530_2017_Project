function [fire, transition] = pre_tTPe_Turn(transition)

[tableau, handle_err, move_btn, turn_btn, handle_move_loc, handle_move_amount] = get_tableau_num_from_transname(transition.name);
fire = 0;
moveToken = tokenArrivedLate('pMC_TP_Turn',1);
if moveToken,
    disp(strcat('TP ',tableau,' Turn trigger'));
    moveCmd = get_color('pMC_TP_Turn',moveToken);
    disp(length(moveCmd));
    if(length(moveCmd) >= 1 && strcmp(moveCmd{1},strcat('Turn:TP',tableau))),
        disp('Turn trigger. Woop');
        transition.selected_tokens = tokenArrivedLate(strcat('pTP_',tableau,'_FaceDown_Pile'),1);
        fire = 1;
    end
end