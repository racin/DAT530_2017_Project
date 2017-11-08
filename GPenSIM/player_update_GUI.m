function [] = player_update_GUI()
global global_info;

%% Clear initial game status.
if global_info.CARDS_DEALT == global_info.INITIAL_DEAL_MOVE_LENGTH,
    set_handle('GameStatus', 'String', '');
end;

%% Update Score
set_handle('Score', 'String', strcat('Score:',{' '},num2str(global_info.SCORE)));

%% Draw Pile
vistoken = tokenArrivedLate('pDP_Draw_FaceUp_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pDP_Draw_FaceUp_Pile',vistoken);
end;
set(global_info.handles.DP_StatusMsg,'String',strcat('#FD: ',num2str(length(tokIDs('pDP_Draw_FaceDown_Pile'))), ...
    ', #FU: ',num2str(length(tokIDs('pDP_Draw_FaceUp_Pile'))),', FU Top:',{' '},topcard));


%% Foundation Piles
foundationpiles = {'Clubs','Diamonds','Hearts','Spades'};
for i = 1:4
    fp = foundationpiles(i);
    pile = fp{1};
    vistoken = tokenArrivedLate(strcat('pFP_',pile,'_Pile'),1);
    topcard = '';
    if vistoken,
        topcard = get_color(strcat('pFP_',pile,'_Pile'),vistoken);
    end;
    statusHandle = strcat('FP_',pile(1),'_StatusMsg');
    set(global_info.handles.(statusHandle),'String',strcat('#: ',num2str(length(tokIDs(strcat('pFP_',pile,'_Pile')))),', Top:',{' '},topcard));
end;

%% Tableau Piles
for i = 1:7
    num = num2str(i);
    numtokens = length(tokIDs(strcat('pTP_',num,'_FaceUp_Pile')));
    vistoken = tokenArrivedLate(strcat('pTP_',num,'_FaceUp_Pile'),numtokens);
    statusmsg = 'Face Up:';
    if vistoken,
        for i = numtokens:-1:1,
            tokencolors = get_color(strcat('pTP_',num,'_FaceUp_Pile'),vistoken(i));
            statusmsg = sprintf('%s\n%s',statusmsg,tokencolors{1});
        end
    end;
    faceup_handle = strcat('TP_',num,'_FaceUpMsg');
    facedown_handle = strcat('TP_',num,'_FaceDownMsg');
    set(global_info.handles.(faceup_handle),'String',statusmsg);
    set(global_info.handles.(facedown_handle),'String',strcat('#FD: ',num2str(length(tokIDs(strcat('pTP_',num,'_FaceDown_Pile'))))));
end;