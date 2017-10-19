function [fire, transition] = tDPi_Turn_pre(transition)

transition.selected_tokens = tokenArrivedLate('pDP_Draw_Face_Down_Pile',1);
fire = 1;