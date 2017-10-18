function [fire, transition] = tDPe_Turn_pre(transition)

global global_info;

% Check if token is without color
if is_enabled('tDPe_Turn'),
    disp('Turn enabled!')
    tokens = tokIDs('pDP_Draw_Pile');
    for i = 1:length(tokens),
        colors = get_color('pDP_Draw_Pile',tokens(i));
        disp(colors);
    end
    % NOTE: In a real game it is the LAST arrived card that is turned.
    % However, in Petri Net, if we turned the last 
    transition.selected_tokens = tokenArrivedEarly('pDP_Draw_Pile',1);
    fire = 1;
else 
    fire = 0;
end;