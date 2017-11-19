function [fire, transition] = tPBi_Destroyer_pre(transition)

% Remove unused commands from pPB_Cmd.
global global_info;
fire = 0;
if length(tokIDs('pPB_Cmd')) > 1 || ~global_info.BOT_ENABLED,
    transition.selected_tokens = tokenArrivedEarly('pPB_Cmd', 1);
    fire = 1;
end;