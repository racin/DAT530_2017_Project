function [fire, transition] = tDPi_Turn_pre(transition)

global global_info;
fire = 0;
dealer_trans = get_trans('tDPi_Dealer');
% Make sure the dealer transition has fired enough times. Simply having an
% inhibitor arc is not enough as this transition seems to fire before all
% tokens are in the face-down pile.
if dealer_trans.times_fired == global_info.INITIAL_DECK_LENGTH,
    disp(strcat('Is enabled dealer: ', num2str(is_enabled('tDPi_Dealer'))));
    transition.selected_tokens = tokenArrivedLate('pDP_Draw_FaceDown_Pile',1);
    fire = 1;
end;