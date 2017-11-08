function [] = tDPi_Flip_Pile_post(transition)
global global_info;
if isempty(tokIDs('pDP_Draw_FaceUp_Pile')),
    global_info.DP_Flip_Pile_Running = false;
    global_info.SCORE = max(global_info.SCORE - 100, 0);
    % Release playerAction resource to allow for another player action.
    release(global_info.last_command_source);
end;
