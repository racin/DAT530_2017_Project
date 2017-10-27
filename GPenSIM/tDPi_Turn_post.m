function [] = tDPi_Turn_post(transition)

disp('Face Up Cards: Btm first.');
tokens = tokIDs('pDP_Draw_FaceUp_Pile');
for i = 1:length(tokens),
    colors = get_color('pDP_Draw_FaceUp_Pile',tokens(i));
    disp(colors);
end
% Release playerAction resource to allow for another player action.
release('tPe_DP_Turn');