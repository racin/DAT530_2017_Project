function [fire, transition] = tMC_FP_Move_Siphon_pre(transition)

% Siphon for the FP Move command. Checks the length of the command, and if
% the length is valid, it will check if the destination is valid.

global global_info;

fire = 0;
moveToken = tokenArrivedLate('pMC_FP_Move',1);
[moveCmd, ~] = splitCommand(get_color('pMC_FP_Move',moveToken));

if(length(moveCmd) < 3 || ~ismember(moveCmd{3}, global_info.FP_PILES)),
    transition.selected_tokens = moveToken;
    fire = 1;
end