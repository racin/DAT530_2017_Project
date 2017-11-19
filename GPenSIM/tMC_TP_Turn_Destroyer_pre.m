function [fire, transition] = tMC_TP_Turn_Destroyer_pre(transition)

% Destroyer for the TP Turn command. Checks the length of the command, and if
% the length is valid, it will check if the destination is valid.

global global_info;

fire = 0;
moveToken = tokenArrivedLate('pMC_TP_Turn',1);
moveCmd = get_color('pMC_TP_Turn',moveToken);

if length(moveCmd) < 1,
    fire = 1;
else,
    cmdSplit = strsplit(moveCmd{1},':');
    if length(cmdSplit) ~= 2 || ~ismember(cmdSplit{2}, global_info.TP_PILES),
        transition.selected_tokens = moveToken;
        fire = 1;
    end;
end;