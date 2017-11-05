function [fire, transition] = tDPe_Out_pre(transition)

% Want to make sure that we get the earliest move-token, and the latest
% card. This is so that we can have a natural ordering of the cards during
% the initial dealing.
moveToken = tokenArrivedEarly('pDP_Move_Out', 1);
% Explicitly sure to get the card at the top of the stack.
cardToken = tokenArrivedLate('pDP_Draw_FaceUp_Pile', 1);
moveColor = get_color('pDP_Move_Out', moveToken);
cardColor = get_color('pDP_Draw_FaceUp_Pile', cardToken);
disp('Move Color');
disp(moveColor);
disp('Card Color');
disp(cardColor);
transition.selected_tokens = [moveToken cardToken];
fire = 1;