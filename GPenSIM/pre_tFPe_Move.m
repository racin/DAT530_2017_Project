function [fire, transition] = pre_tFPe_Move(transition)

fire = 0;
moveToken = tokenArrivedLate('pMC_FP_Move',1);
[suit_abbr, suit, ~] = get_suit_from_transname(transition.name);
[moveCmd, ~] = splitCommand(get_color('pMC_FP_Move',moveToken));
if(length(moveCmd) >= 3 && strcmp(moveCmd{3},strcat('FP',suit_abbr))),
    transition.selected_tokens = moveToken;
    fire = 1;
end