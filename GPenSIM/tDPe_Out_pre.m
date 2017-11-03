function [fire, transition] = pre_tFPe_Out(transition)

% Explicitly sure to get the card at the top of the stack.
moveToken = tokenArrivedLate('pDP_Move_Out', 1);
cardToken = tokenArrivedLate('pDP_Draw_FaceUp_Pile', 1);
moveColor = get_color('pDP_Move_Out', moveToken);
cardColor = get_color('pDP_Draw_FaceUp_Pile', cardToken);
disp('Move Color');
disp(moveColor);
disp('Card Color');
disp(cardColor);
transition.selected_tokens = [moveToken cardToken];
fire = 1;