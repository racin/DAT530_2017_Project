function [fire, transition] = tMC_Out_Buffer_Siphon_pre(transition)

% Siphon for the Out command from all modules. Will first check if the
% length of the command is correct, and then if the destination is valid.

global global_info;

fire = 0;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;

moveToken = tokenArrivedEarly('pMC_Out_Buffer',1);
tokenColor = get_color('pMC_Out_Buffer',moveToken);
[command, ~] = splitCommand(tokenColor);

if length(tokenColor) ~= 2 || ~ismember(command{2}, global_info.FP_TP_PILES),
    transition.selected_tokens = moveToken;
    fire = 1;
    return;
end;
