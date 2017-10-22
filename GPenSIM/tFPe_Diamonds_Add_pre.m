function [fire, transition] = tFPe_Diamonds_Add_pre(transition)



moveToken = tokenArrivedLate('pMC_DP_Out',1);
tokenColor = get_color('pMC_DP_Move',moveToken);

disp(strcat('Diamonds add token color: ', tokenColor));
%if(checkCommand_Move()),
    
    transition.selected_tokens = moveToken;
    fire = 1;
%end;
fire = 0;