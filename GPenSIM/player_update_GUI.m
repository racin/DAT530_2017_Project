function [] = player_update_GUI()
global global_info;

%% Update GUI
vistoken = tokenArrivedLate('pDP_Draw_FaceUp_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pDP_Draw_FaceUp_Pile',vistoken);
end;
set(global_info.handles.DP_StatusMsg,'String',strcat('#FD: ',num2str(length(tokIDs('pDP_Draw_FaceDown_Pile'))), ...
    ', #FU: ',num2str(length(tokIDs('pDP_Draw_FaceUp_Pile'))),', FU Top:',{' '},topcard));

%% Foundation Pile - Clubs
vistoken = tokenArrivedLate('pFP_Clubs_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pFP_Clubs_Pile',vistoken);
end;
set(global_info.handles.FP_C_StatusMsg,'String',strcat('#: ',num2str(length(tokIDs('pFP_Clubs_Pile'))), ...
    ', Top:',{' '},topcard));

%% Foundation Pile - Diamonds
vistoken = tokenArrivedLate('pFP_Diamonds_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pFP_Diamonds_Pile',vistoken);
end;
set(global_info.handles.FP_D_StatusMsg,'String',strcat('#: ',num2str(length(tokIDs('pFP_Diamonds_Pile'))), ...
    ', Top:',{' '},topcard));

%% Foundation Pile - Hearts
vistoken = tokenArrivedLate('pFP_Hearts_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pFP_Hearts_Pile',vistoken);
end;
set(global_info.handles.FP_H_StatusMsg,'String',strcat('#: ',num2str(length(tokIDs('pFP_Hearts_Pile'))), ...
    ', Top:',{' '},topcard));

%% Foundation Pile - Spades
vistoken = tokenArrivedLate('pFP_Spades_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pFP_Spades_Pile',vistoken);
end;
set(global_info.handles.FP_S_StatusMsg,'String',strcat('#: ',num2str(length(tokIDs('pFP_Spades_Pile'))), ...
    ', Top:',{' '},topcard));