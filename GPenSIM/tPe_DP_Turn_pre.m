function [fire, transition] = tPe_DP_Turn_pre(transition)


pause(0.01); % Halts execution in the main loop to allow to check for events.
fire = 0;
global global_info;
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.DP_Turn_Btn ~= false && playerAction,
    global_info.DP_Turn_Btn = false;
    disp('DP Turn clicked!');
    fire = 1;
end;