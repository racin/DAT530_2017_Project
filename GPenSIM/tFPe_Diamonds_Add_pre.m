function [fire, transition] = tFPe_Diamonds_Add_pre(transition)

disp('Checking Diamonds.');
fire = 0;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return;
    end;
    
    disp('Diamonds');
    disp(checkCommand_Move(tokenColor,'Diamonds'));
    if(checkCommand_Move(tokenColor,'Diamonds')),
        [moveCmd, card] = splitCommand(tokenColor);
        disp(strcat('Diamonds add token color:',{' '}, card));  
        disp(strcat('Diamonds command:',{' '}, moveCmd));
        transition.selected_tokens = moveToken;
        fire = 1;
    end
end
