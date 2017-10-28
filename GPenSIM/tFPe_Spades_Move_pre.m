function [fire, transition] = tFPe_Spades_Move_pre(transition)

fire = 0;
moveToken = tokenArrivedLate('pMC_FP_Move',1);
if moveToken,
    [moveCmd, card] = splitCommand(get_color('pMC_FP_Move',moveToken));
    if(length(moveCmd) >= 3 && strcmp(moveCmd{3},'FPS')),
        disp('Spades move trigger');
        transition.selected_tokens = moveToken;
        fire = 1;
    end
end