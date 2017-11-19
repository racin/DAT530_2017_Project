function [fire, transition] = pre_tTPi_Move_Multiple(transition)

global global_info;
fire = 0;

if global_info.TP_Move_Multi_Gen_Tokens > 0,
    [tableau, ~, ~, ~, ~, ~]  = get_tableau_from_transname(transition.name);
    moveToken = tokenArrivedEarly(strcat('pTP_',tableau,'_Move'),1);
    transition.selected_token = moveToken;
    transition.new_color = get_color(strcat('pTP_',tableau,'_Move'),moveToken);
    transition.override = 1;
    fire = 1;
end;