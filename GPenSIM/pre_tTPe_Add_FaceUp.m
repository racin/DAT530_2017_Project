function [fire, transition] = pre_tTPe_Add_FaceUp(transition)

global global_info;
[tableau, handle_err, ~, ~, ~, ~] = get_tableau_num_from_transname(transition.name);
fire = 0;
% Can only add FaceUp cards once the initial dealing is complete.
isFDFull = length(tokIDs(strcat('pTP_',tableau,'_FaceDown_Pile'))) + 1 == str2double(tableau);
isDealingInProgress = global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH;
disp('isDealingInProgress');
disp(isDealingInProgress);
disp('cardsDealt');
disp(global_info.CARDS_DEALT);
disp('INITIAL_DEAL_MOVE_LENGTH');
disp(global_info.INITIAL_DEAL_MOVE_LENGTH);
if isDealingInProgress && ~isFDFull,
%     disp('Face UP return');
    return;
end;
moveToken = tokenArrivedEarly('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
%         disp(strcat('Length of color was: ', num2str(length(tokenColor))));
%         disp(strcat('Color: ', tokenColor));
        return;
    end;
    if isDealingInProgress && isFDFull,
        %global_info.last_command_source = 'tPe_DP_Move';
        doCommand = true;
        [moveCmd, card] = splitCommand(tokenColor);
        moveCmd = moveCmd{2};
    else,
        [doCommand, moveCmd, card] = checkCommand_Move(tokenColor,tableau,'',handle_err);
    end
    
%     disp(strcat('Tableau Pile ',tableau,' doCommand:',{' '}, num2str(doCommand)));
%     disp(strcat('Tableau Pile ',tableau,' add token color:',{' '}, card));  
%     disp(strcat('Tableau Pile ',tableau,' command:',{' '}, moveCmd));
    if(doCommand && strcmp(moveCmd,strcat('TP',tableau))),
%         disp(strcat('Tableau Pile ',tableau,' add token color:',{' '}, card));  
%         disp(strcat('Tableau Pile ',tableau,' command:',{' '}, moveCmd));
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
%         disp('FACE UP FIRED');
    end
end