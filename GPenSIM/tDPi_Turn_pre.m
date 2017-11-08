function [fire, transition] = tDPi_Turn_pre(transition)

global global_info;
fire = 0;
dealer_trans = get_trans('tDPi_Dealer');
% Make sure the dealer transition has fired enough times. Simply having an
% inhibitor arc is not enough as this transition seems to fire before all
% tokens are in the face-down pile.
if dealer_trans.times_fired == global_info.INITIAL_DECK_LENGTH,
    topFD = tokenArrivedLate('pDP_Draw_FaceDown_Pile',1);
    transition.selected_tokens = topFD;
    fire = 1;
    if(global_info.DISP_CHANGES && global_info.CARDS_DEALT >= global_info.INITIAL_DEAL_MOVE_LENGTH),
        color = get_color('pDP_Draw_FaceDown_Pile', topFD);
        disp(strcat('Turned card',{' '},color{1},{' '},'at',{' DP'}));
    end;
end;