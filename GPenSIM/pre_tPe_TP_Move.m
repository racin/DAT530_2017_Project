function [fire, transition] = pre_tPe_TP_Move(transition)

fire = 0;
global global_info;
[tableau, handle_err, move_btn, turn_btn, handle_move_loc, handle_move_amount] = get_tableau_num_from_transname(transition.name);
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.(move_btn) ~= false && playerAction,
    global_info.(move_btn) = false;
    disp(strcat('TP ',tableau,' move btn'));
    dest = get_handle(handle_move_loc,'String');
    amount = get_handle(handle_move_amount,'String');
    command = strcat('Move:',dest,strcat(':TP',tableau));
    % TODO: Finish tableau move.
    vistoken = tokenArrivedLate('pFP_Spades_Pile',1);
    if vistoken,
        color = get_color('pFP_Spades_Pile',vistoken);
        color = color{1};
        if checkCommand_Move({command;color},'',transition.name,global_info.handles.FP_S_ErrorMsg),
            transition.new_color = command;
            fire = 1;
        end;
    end;
end