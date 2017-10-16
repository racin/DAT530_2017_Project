function [fire, transition] = tDPe_Turn_pre(transition)

global global_info;

% Check if token is without color
if is_enabled('tDPe_Turn'),
    disp('Turn enabled!')
    fire = 1;
else
    fire = 0;
end;