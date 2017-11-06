function [fire, transition] = pre_tPe_FP_Move(transition)

global global_info;
fire = 0;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;

[suit_abbr, suit, handle_err, move_btn, handle_move_loc] = get_suit_from_transname(transition.name);
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.(move_btn) ~= false && playerAction,
    %global_info = setfield(global_info,move_btn,false);
    global_info.(move_btn) = false;
    disp(strcat(suit,' move btn'));
    dest = get_handle(handle_move_loc,'String');
    command = strcat('Move:',dest,':',strcat('FP',suit_abbr));    
    vistoken = tokenArrivedLate(strcat('pFP_',suit,'_Pile'),1);
    if vistoken,
        color = get_color(strcat('pFP_',suit,'_Pile'),vistoken);
        color = color{1};
        if checkCommand_Move({command;color},'',transition.name,handle_err),
            transition.new_color = command;
            fire = 1;
        end;
    end;
end