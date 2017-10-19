function [] = tDPi_Flip_Pile_post(transition)
global global_info;
if length(tokIDs('pDP_Draw_Face_Up_Pile')) == 0,
    
    global_info.DP_Flip_Pile_Running = false;
    disp('Ending Reverse Pile.');
end;
