function [] = tDPi_Turn_post(transition)

disp('Face Up Cards: Btm first.');
tokens = tokIDs('pDP_Draw_Face_Up_Pile');
for i = 1:length(tokens),
    colors = get_color('pDP_Draw_Face_Up_Pile',tokens(i));
    disp(colors);
end