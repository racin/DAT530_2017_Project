function [fire, transition] = tDPi_Move_Init(transition)

% TODO: Set correct move command.
transition.selected_tokens = tokenArrivedLate('pDP_Draw_FaceDown_Pile',1);
fire = 0;