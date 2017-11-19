function [fire, transition] = pre_tPe_TP_Move(transition)

global global_info;
fire = 0;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;

[tableau, handle_err, move_btn, ~, handle_move_loc, handle_move_amount]...
    = get_tableau_from_transname(transition.name);
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.(move_btn) ~= false && playerAction,
    global_info.(move_btn) = false;
    dest = upper(get_handle(handle_move_loc,'String'));
    
    % Is amount numeric and equal or less that current cards in FaceUp?
    if ismember(dest, global_info.FP_PILES),
        amount = 1;
    else,
        amount = str2double(get_handle(handle_move_amount,'String'));
        if isnan(amount) || amount < 1,
            amount = 1;
        end;
        if amount > length(tokIDs(strcat('pTP_',tableau,'_FaceUp_Pile'))),
            set_handle(handle_err,'String','INVALID AMOUNT');
            return;
        end;
    end;

    command = strcat('Move:',dest,':TP',tableau,':',num2str(amount));

    vistoken = tokenArrivedLate(strcat('pTP_',tableau,'_FaceUp_Pile'),amount);
    vistoken = vistoken(amount);
    if vistoken,
        color = get_color(strcat('pTP_',tableau,'_FaceUp_Pile'),vistoken);
        color = color{1};
        if checkCommand_Move({command;color},'',transition.name,handle_err),
            % Need some sort of perpetual fireing.
            transition.new_color = command;
            fire = 1;
        end;
    end;
end