function [fire, transition] = tTPe_1_Add_FaceUp_pre(transition)

global global_info;
fire = 0;
tpnum = 7;
% Can only add FaceUp cards once the initial dealing is complete.
isFDFull = (length(tokIDs('pTP_1_FaceDown_Pile')) + 1 == tpnum);
isDealingInProgress = length(tokIDs('pDP_Draw_FaceDown_Pile')+length(tokIDs('pDP_Draw_FaceUp_Pile'))) > 24;
if isDealingInProgress && ~isFDFull,
    disp('Face UP return');
    return;
end;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return;
    end;
    if isDealingInProgress && isFDFull,
        global_info.last_command_source = 'tPe_DP_Move';
        doCommand = true;
        [moveCmd, card] = splitCommand(tokenColor);
    else,
        [doCommand, moveCmd, card] = checkCommand_Move(tokenColor,'1','',global_info.handles.TP_1_ErrorMsg);
    end
    
    disp(strcat('Tableau Pile 1 doCommand:',{' '}, num2str(doCommand)));
    disp(strcat('Tableau Pile 1 add token color:',{' '}, card));  
    disp(strcat('Tableau Pile 1 command:',{' '}, moveCmd));
    if(doCommand),
        disp(strcat('Tableau Pile 1 add token color:',{' '}, card));  
        disp(strcat('Tableau Pile 1 command:',{' '}, moveCmd));
        transition.selected_tokens = moveToken;
        transition.new_color = card;
        transition.override = 1;
        fire = 1;
        disp('FACE UP FIRED');
    end
end