function [] = player_update_GUI()
global global_info;

%% Draw Pile
vistoken = tokenArrivedLate('pDP_Draw_FaceUp_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pDP_Draw_FaceUp_Pile',vistoken);
end;
set(global_info.handles.DP_StatusMsg,'String',strcat('#FD: ',num2str(length(tokIDs('pDP_Draw_FaceDown_Pile'))), ...
    ', #FU: ',num2str(length(tokIDs('pDP_Draw_FaceUp_Pile'))),', FU Top:',{' '},topcard));


% TODO: Clean up this with loops for FP and TP
%% Foundation Pile - Clubs
vistoken = tokenArrivedLate('pFP_Clubs_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pFP_Clubs_Pile',vistoken);
end;
set(global_info.handles.FP_C_StatusMsg,'String',strcat('#: ',num2str(length(tokIDs('pFP_Clubs_Pile'))),', Top:',{' '},topcard));

%% Foundation Pile - Diamonds
vistoken = tokenArrivedLate('pFP_Diamonds_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pFP_Diamonds_Pile',vistoken);
end;
set(global_info.handles.FP_D_StatusMsg,'String',strcat('#: ',num2str(length(tokIDs('pFP_Diamonds_Pile'))),', Top:',{' '},topcard));

%% Foundation Pile - Hearts
vistoken = tokenArrivedLate('pFP_Hearts_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pFP_Hearts_Pile',vistoken);
end;
set(global_info.handles.FP_H_StatusMsg,'String',strcat('#: ',num2str(length(tokIDs('pFP_Hearts_Pile'))),', Top:',{' '},topcard));

%% Foundation Pile - Spades
vistoken = tokenArrivedLate('pFP_Spades_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pFP_Spades_Pile',vistoken);
end;
set(global_info.handles.FP_S_StatusMsg,'String',strcat('#: ',num2str(length(tokIDs('pFP_Spades_Pile'))),', Top:',{' '},topcard));

%% Tableau Pile - 1
numtokens = length(tokIDs('pTP_1_FaceUp_Pile'));
vistoken = tokenArrivedLate('pTP_1_FaceUp_Pile',numtokens);
statusmsg = 'Face Up:';
if vistoken,
    for i = numtokens:-1:1,
        tokencolors = get_color('pTP_1_FaceUp_Pile',vistoken(i));
        statusmsg = sprintf('%s\n%s',statusmsg,tokencolors{1});
    end
end;
set(global_info.handles.TP_1_FaceUpMsg,'String',statusmsg);
set(global_info.handles.TP_1_FaceDownMsg,'String',strcat('#FD: ',num2str(length(tokIDs('pTP_1_FaceDown_Pile')))));
