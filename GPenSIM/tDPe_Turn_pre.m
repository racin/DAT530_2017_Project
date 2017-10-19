function [fire, transition] = tDPe_Turn_pre(transition)

global global_info;

disp('Turn enabled!')
tokens = tokIDs('pDP_Draw_Face_Up_Pile');
for i = 1:length(tokens),
    colors = get_color('pDP_Draw_Face_Up_Pile',tokens(i));
    disp(colors);
end
% NOTE: In a real game it is the LAST arrived card that is turned.
% However, in Petri Net, if we turned the last 
transition.selected_tokens = tokenArrivedLate('pDP_Draw_Face_Down_Pile',1);
fire = 1;