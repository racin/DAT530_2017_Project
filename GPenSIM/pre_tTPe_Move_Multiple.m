function [fire, transition] = pre_tTPe_Move_Multiple(transition)

global global_info;
fire = 0;

% TP_Move_Multiple is set to the tableau number which triggered it.
% Reasoning why this is done this way: We want to make sure that the last
% moved card has reached its destination (Some tableau pile) before
% releasing the playerAction resource. If we just blindly generated the
% required number of movecommands, there could be some 'hard-to-find' bugs
% as the bot (or the player) could introduce commands based on the current
% state of the PN, which would become illegal just moments later. There is
% probably more elegant ways to do this, such as checking the times_fires
% of the add-face-up transitions.

if global_info.TP_Move_Multi_Gen_Tokens > 0,
    transition.new_color = global_info.TP_Move_LastCmd;
    transition.override = 1;
    fire = 1;
    disp('Move multiple trigger.');
end;