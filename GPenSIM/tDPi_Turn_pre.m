function [fire, transition] = tDPi_Turn_pre(transition)

disp(strcat('Is enabled dealer: ', num2str(is_enabled('tDPi_Dealer'))));
transition.selected_tokens = tokenArrivedLate('pDP_Draw_FaceDown_Pile',1);
fire = 1;