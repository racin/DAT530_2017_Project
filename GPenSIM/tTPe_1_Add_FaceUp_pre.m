function [fire, transition] = tTPe_1_Add_FaceUp_pre(transition)


disp('Face-up');
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    disp(strcat('Tableau 1 Face Up add token color: ', tokenColor));
    transition.selected_tokens = moveToken;
    fire = 0;
    return;
end

fire = 0;