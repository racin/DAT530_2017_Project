function [] = tDPi_Enable_FP_Trans_post(transition)

global global_info;

if length(tokIDs('pDP_Draw_FaceUp_Pile')) > 0,
    disp('Enabling Flip Pile!');
    global_info.DP_Flip_Pile_Running = true;
else,
    % Release playerAction resource to allow for another player action.
    release('tPe_DP_Turn');
end;