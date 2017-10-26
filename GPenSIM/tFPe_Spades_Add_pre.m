function [fire, transition] = tFPe_Spades_Add_pre(transition)

disp('Checking Spades.');
fire = 0;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return;
    end;
    
    if(checkCommand_Move(tokenColor,'Spades')),
        [moveCmd, card] = splitCommand(tokenColor);
        disp(strcat('Spades add token color:',{' '}, card));  
        disp(strcat('Spades command:',{' '}, moveCmd));
        transition.selected_tokens = moveToken;
        fire = 1;
    end
end