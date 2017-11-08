function [fire, transition] = tDPi_Flip_Pile_pre(transition)

global global_info;
fire = 0;
if global_info.DP_Flip_Pile_Running == true,
    transition.selected_tokens = tokenArrivedLate('pDP_Draw_FaceUp_Pile',1);
    fire = 1;    
end

