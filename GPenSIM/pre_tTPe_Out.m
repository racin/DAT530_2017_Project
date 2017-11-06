function [fire, transition] = pre_tTPe_Out(transition)

global global_info;
disp(strcat(transition.name,{' '},'enabled!'));
[tableau, ~, ~, ~, ~, ~]  = get_tableau_num_from_transname(transition.name)
moveToken = tokenArrivedLate(strcat('pTP_',tableau,'_Move'),1);
cardToken = tokenArrivedLate(strcat('pTP_',tableau,'_FaceUp_Pile'), global_info.TP_Move_Multiple_Count);
cardToken = cardToken(global_info.TP_Move_Multiple_Count);

transition.selected_tokens = [moveToken cardToken];
fire = 1;