function [fire, transition] = tTPe_1_Add_FaceDown_pre(transition)

global global_info;
fire = 0;
% Can only add FaceDown cards during the initial dealing.
if length(tokIDs('pDP_Draw_FaceDown_Pile')) <= 24 || (length(tokIDs('pTP_1_FaceDown_Pile')) + 1) == 7,
    print('Face DOWN return');
    return;
end;
moveToken = tokenArrivedLate('pMC_Out_Buffer',1);
if moveToken,
    tokenColor = get_color('pMC_Out_Buffer',moveToken);
    if(length(tokenColor) ~= 2),
        return;
    end;
    [doCommand, moveCmd, card] = checkCommand_Move(tokenColor,'1','',global_info.handles.TP_1_ErrorMsg);
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