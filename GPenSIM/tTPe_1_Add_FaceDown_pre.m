function [fire, transition] = tTPe_1_Add_FaceDown_pre(transition)


fire = 0;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return
    end;
    
    disp('Face-down');
    disp(tokenColor);
    return;
    %[moveCmd, card] = splitCommand(tokenColor);
    %disp(strcat('Tableau 1 Face Down add token color:',{' '}, card));  
    %disp(strcat('Tableau 1 Face Down command:',{' '}, moveCmd));
    %transition.selected_tokens = moveToken;
    %fire = 0;
    
end