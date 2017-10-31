function [fire, transition] = pre_tPe_TP_Turn(transition)

fire = 0;
global global_info;
[tableau, handle_err, move_btn, turn_btn, handle_move_loc, handle_move_amount] = get_tableau_num_from_transname(transition.name);
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.(turn_btn) ~= false && playerAction,
    global_info.(turn_btn) = false;
    if ~isempty(tokIDs(strcat('pTP_',tableau,'_FaceUp_Pile'))),
        set_handle(handle_err,'String','FaceUp Pile must be empty');
        return;
    end;
    set_handle(handle_err,'String','');
    global_info.last_command_source = transition.name;
    disp(strcat('TP ',tableau,' Turn clicked!'));
    transition.new_color = strcat('Turn:TP',tableau);
    fire = 1;
end;