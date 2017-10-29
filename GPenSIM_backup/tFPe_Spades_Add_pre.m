function [fire, transition] = tFPe_Spades_Add_pre(transition)

global global_info;
fire = 0;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return;
    end;
    [doCommand, moveCmd, card] = checkCommand_Move(tokenColor,'Spades','',global_info.handles.FP_S_ErrorMsg);
    if(doCommand),
        disp(strcat('Spades add token color:',{' '}, card));  
        disp(strcat('Spades command:',{' '}, moveCmd));
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
    end
end