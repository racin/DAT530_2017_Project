function [fire, transition] = pre_tFPe_Out(transition)

% Explicitly sure to get the card at the top of the stack.
[~, suit, ~] = get_suit_from_transname(transition.name);

moveToken = tokenArrivedEarly(strcat('pFP_',suit,'_Move'), 1);
cardToken = tokenArrivedLate(strcat('pFP_',suit,'_Pile'), 1);

transition.selected_tokens = [moveToken cardToken];
fire = 1;