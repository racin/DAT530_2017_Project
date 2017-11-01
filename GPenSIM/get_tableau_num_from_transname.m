function [tableau, handle_err, move_btn, turn_btn, handle_move_loc, handle_move_amount] ...
    = get_tableau_num_from_transname(transitionname)
    global global_info;
    handle_err = 0;
    move_btn = 0;
    turn_btn = 0;
    handle_move_loc = 0;
    handle_move_amount = 0;
    if ~isempty(strfind(transitionname,'1')),
        tableau = '1';
    elseif ~isempty(strfind(transitionname,'2')),
        tableau = '2';
    elseif ~isempty(strfind(transitionname,'3')),
        tableau = '3';
    elseif ~isempty(strfind(transitionname,'4')),
        tableau = '4';
    elseif ~isempty(strfind(transitionname,'5')),
        tableau = '5';
    elseif ~isempty(strfind(transitionname,'6')),
        tableau = '6';
    else,
        tableau = '7';
    end
    if global_info.GUI_ENABLED,
        handle_err = strcat('TP_',tableau,'_ErrorMsg');
        move_btn = strcat('TP_',tableau,'_Move_Btn');
        turn_btn = strcat('TP_',tableau,'_Turn_Btn');
        handle_move_loc = strcat('TP_',tableau,'_Move_Location');
        handle_move_amount = strcat('TP_',tableau,'_Move_Amount');
    end
end