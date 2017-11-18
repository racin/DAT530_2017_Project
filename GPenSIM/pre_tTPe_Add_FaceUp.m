function [fire, transition] = pre_tTPe_Add_FaceUp(transition)

global global_info;
[tableau, handle_err, ~, ~, ~, ~] = get_tableau_from_transname(transition.name);
fire = 0;

% Can only add FaceUp cards once the initial dealing is complete.
isFDFull = length(tokIDs(strcat('pTP_',tableau,'_FaceDown_Pile'))) + 1 ...
    == str2double(tableau);
isDealingInProgress = global_info.CARDS_DEALT < ...
    global_info.INITIAL_DEAL_MOVE_LENGTH;
if isDealingInProgress && ~isFDFull,
    return;
end;

moveToken = tokenArrivedEarly('pMC_Out_Buffer',1);
tokenColor = get_color('pMC_Out_Buffer',moveToken);
if(length(tokenColor) ~= 2),
    return;
end;

if isDealingInProgress && isFDFull,
    doCommand = true;
    [moveCmd, card] = splitCommand(tokenColor);
    cmdDest = moveCmd{2};
    source = 'DP';
else,
    [doCommand, cmdDest, card, cmdSource] = ...
        checkCommand_Move(tokenColor,tableau,'',handle_err);
    source = cmdSource;
end

if(doCommand && strcmp(cmdDest,strcat('TP',tableau))),
    transition.selected_tokens = moveToken;
    transition.new_color = card;
    transition.override = 1;
    fire = 1;

    if ~isDealingInProgress,
        if strcmp(source,'DP'),
            % 10 Points when moving from Draw Pile to Tableau
            global_info.SCORE = global_info.SCORE + 5;
        elseif ismember(source,global_info.FP_PILES),
            % Lose 15 points when moving from a Foundation Pile to Tableau
            global_info.SCORE = max(global_info.SCORE - 15, 0);
        end;
    end
    if(global_info.DISP_CHANGES),
        disp(strcat('Moved card',{' '},card,{' '},'from',{' '},source,...
            {' '},'to',{' '},cmdDest,{' '},'(FU)'));
    end;
end