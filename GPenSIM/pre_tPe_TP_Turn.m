function [fire, transition] = pre_tPe_TP_Turn(transition)

global global_info;
fire = 0;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;

[tableau, handle_err, move_btn, turn_btn, handle_move_loc, handle_move_amount] = get_tableau_num_from_transname(transition.name);
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.(turn_btn) ~= false && playerAction,
    global_info.(turn_btn) = false;
    if ~isempty(tokIDs(strcat('pTP_',tableau,'_FaceUp_Pile'))),
        set_handle(handle_err,'String','FaceUp Pile must be empty');
        return;
    elseif isempty(tokIDs(strcat('pTP_',tableau,'_FaceDown_Pile'))),
        set_handle(handle_err,'String','FaceDown Pile is empty');
        return;
    end;
    set_handle(handle_err,'String','');
    global_info.last_command_source = transition.name;
    transition.new_color = strcat('Turn:TP',tableau);
    fire = 1;
end;