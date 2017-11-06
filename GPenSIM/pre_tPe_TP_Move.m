function [fire, transition] = pre_tPe_TP_Move(transition)

global global_info;
fire = 0;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;

[tableau, handle_err, move_btn, turn_btn, handle_move_loc, handle_move_amount] = get_tableau_num_from_transname(transition.name);
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.(move_btn) ~= false && playerAction,
    global_info.(move_btn) = false;
    disp(strcat('TP ',tableau,' move btn'));
    dest = get_handle(handle_move_loc,'String');
    if ~isempty(strfind(dest,'FP')),
        amount = 1;
    else,
        amount = str2double(get_handle(handle_move_amount,'String'));
        if isnan(amount) || amount < 1,
            amount = 1;
        end;
        disp(strcat('Amount:',num2str(amount)));
        if amount > length(tokIDs(strcat('pTP_',tableau,'_FaceUp_Pile'))),
            set_handle(handle_err,'String','INVALID AMOUNT');
            return;
        end;
    end;
%     
%     doCommand = check_tPe_TP_Turn(transition.name, dest, amount);
%     % Does destiation exist?
%     
%     % Is amount numeric and equal or less that current cards in FaceUp?
%     
%     lenFaceUpTokens = tokIDs(strcat('pTP_',modname,'_FaceUp_Pile'));
    command = strcat('Move:',dest,':TP',tableau,':',num2str(amount));
    disp(command);
    % TODO: Finish tableau move.
    vistoken = tokenArrivedLate(strcat('pTP_',tableau,'_FaceUp_Pile'),num2str(amount));
    vistoken = vistoken(amount);
    if vistoken,
        color = get_color(strcat('pTP_',tableau,'_FaceUp_Pile'),vistoken);
        color = color{1};
        disp(strcat('Color of',{' '}, num2str(amount), 'th card: ', color));
        if checkCommand_Move({command;color},'',transition.name,handle_err),
            % Need some sort of perpetual fireing.
            transition.new_color = command;
            fire = 1;
        end;
    end;
end