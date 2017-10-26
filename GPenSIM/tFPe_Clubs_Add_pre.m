function [fire, transition] = tFPe_Clubs_Add_pre(transition)


disp('Checking Clubs.');
fire = 0;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return;
    end;
    
    if(checkCommand_Move(tokenColor,'Clubs')),
        [moveCmd, card] = splitCommand(tokenColor);
        disp(strcat('Clubs add token color:',{' '}, card));  
        disp(strcat('Clubs command:',{' '}, moveCmd));
        transition.selected_tokens = moveToken;
        fire = 1;
    end
end