function [fire, transition] = tDPe_Turn_pre(transition)

global global_info;

% Check if token is without color
if is_enabled('tDPe_Turn'),
    disp('Turn enabled!')
    %disp(struct2array(get_current_colors()))
    tokens = tokIDs('pDP_Draw_Pile');
    for i = 1:length(tokens),
        colors = get_color('pDP_Draw_Pile',tokens(i));
        disp(colors);
    end
    trans = tokenArrivedLate('pDP_Draw_Pile',1);
    %trans{'time'} = 1.5; HOW TO RESET TO FRONT OF QUEUE? INTERMEDIATE
    %TRANS?
    transition.new_color = strcat('racin',num2str(rand()*10));
    transition.selected_tokens = trans;
    fire = 1;
else
    fire = 0;
end;