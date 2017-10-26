function [fire, transition] = tDPi_Flip_Pile_pre(transition)


global global_info;
if global_info.DP_Flip_Pile_Running == true,
    disp('Moving cards from FU to FD');
    transition.selected_tokens = tokenArrivedLate('pDP_Draw_FaceUp_Pile',1);
    fire = 1;
else,
    fire = 0;
end

