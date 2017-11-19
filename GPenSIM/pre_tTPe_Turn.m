function [fire, transition] = pre_tTPe_Turn(transition)

global global_info;
fire = 0;
moveToken = tokenArrivedLate('pMC_TP_Turn',1);
[tableau, ~, ~, ~, ~, ~] = get_tableau_from_transname(transition.name);
turnCmd = get_color('pMC_TP_Turn',moveToken);

if(length(turnCmd) >= 1 && strcmp(turnCmd{1},strcat('Turn:TP',tableau))),
    topCard = tokenArrivedLate(strcat('pTP_',tableau,'_FaceDown_Pile'),1);
    transition.selected_tokens = topCard;
    color = get_color(strcat('pTP_',tableau,'_FaceDown_Pile'), topCard);
    transition.new_color = color{1};
    transition.override = 1;
    fire = 1;
    global_info.SCORE = global_info.SCORE + 5;
    if(global_info.DISP_CHANGES),
        disp(strcat('Turned card',{' '},color{1},{' '},'at',{' TP'},tableau));
    end;
end