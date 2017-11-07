function [fire, transition] = tPe_DP_Turn_pre(transition)

global global_info;
pause(0.01); % Halts execution in the main loop to allow to check for events.
fire = 0;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;

[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.DP_Turn_Btn ~= false && playerAction,
    global_info.DP_Turn_Btn = false;
    global_info.last_command_source = transition.name;
    fire = 1;
end;