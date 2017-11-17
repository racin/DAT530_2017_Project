function [] = tDPi_Enable_FP_Trans_post(transition)

global global_info;
if ~isempty(tokIDs('pDP_Draw_FaceUp_Pile')),
    global_info.DP_Flip_Pile_Running = true;
else,
    % Release playerAction resource to allow for another player action.
    release(global_info.last_command_source);
end;