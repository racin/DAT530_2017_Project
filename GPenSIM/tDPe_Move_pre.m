function [fire, transition] = tDPe_Move_pre(transition)



moveToken = tokenArrivedEarly('pMC_DP_Move',1);
tokenColor = get_color('pMC_DP_Move',moveToken);
transition.selected_tokens = moveToken;
disp(strcat('sMove token color: ', tokenColor));
fire = 1;