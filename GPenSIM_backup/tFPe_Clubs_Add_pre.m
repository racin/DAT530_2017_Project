function [fire, transition] = tFPe_Clubs_Add_pre(transition)

global global_info;
fire = 0;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return;
    end;
    [doCommand, moveCmd, card] = checkCommand_Move(tokenColor,'Clubs','',global_info.handles.FP_C_ErrorMsg);
    if(doCommand),
        disp(strcat('Clubs add token color:',{' '}, card));  
        disp(strcat('Clubs command:',{' '}, moveCmd));
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
    end
end