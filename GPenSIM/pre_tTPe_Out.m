function [fire, transition] = pre_tTPe_Out(transition)

global global_info;
fire = 0;
disp(strcat(transition.name,{' '},'CHECKING!'));

if global_info.TP_Move_Multi_Gen_Tokens == 0,
    [tableau, ~, ~, ~, ~, ~]  = get_tableau_num_from_transname(transition.name);
    disp(strcat(transition.name,{' '},'enabled!'));
    moveToken = tokenArrivedLate(strcat('pTP_',tableau,'_Move'),1);
    lenMoveTokens = length(tokIDs(strcat('pTP_',tableau,'_Move')));
    cardToken = tokenArrivedLate(strcat('pTP_',tableau,'_FaceUp_Pile'), ...
        lenMoveTokens);
    cardToken = cardToken(lenMoveTokens);
    disp(get_color(strcat('pTP_',tableau,'_FaceUp_Pile'), cardToken));
    transition.selected_tokens = [moveToken cardToken];
    fire = 1;
end;