function [fire, transition] = pre_tFPe_Add(transition)

global global_info;
fire = 0;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return;
    end;
    [~, suit, handle_err] = get_suit_from_transname(transition.name);
    [doCommand, moveCmd, card] = checkCommand_Move(tokenColor,suit,'',handle_err);
    if(doCommand),
        disp(strcat(suit,'x add token color:',{' '}, card));  
        disp(strcat(suit,'x command:',{' '}, moveCmd));
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
    end
end