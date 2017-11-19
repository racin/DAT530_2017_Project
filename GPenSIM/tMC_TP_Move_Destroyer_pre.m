function [fire, transition] = tMC_TP_Move_Destroyer_pre(transition)

% Destroyer for the TP Move command. Checks the length of the command, and if
% the length is valid, it will check if the destination is valid.

global global_info;

fire = 0;
moveToken = tokenArrivedLate('pMC_TP_Move',1);
moveColor = get_color('pMC_TP_Move',moveToken);
[moveCmd, ~] = splitCommand(moveColor);

if length(moveCmd) < 4 || ~ismember(moveCmd{3},global_info.TP_PILES),
    transition.selected_tokens = moveToken;
    fire = 1;
end;