function [] = COMMON_POST(transition)

global global_info;

%% Update GUI
vistoken = tokenArrivedLate('pDP_Draw_Face_Up_Pile',1);
topcard = '';
if vistoken,
    topcard = get_color('pDP_Draw_Face_Up_Pile',vistoken);
end;
set(global_info.handles.DP_StatusMsg,'String',strcat('#FD: ',num2str(length(tokIDs('pDP_Draw_Face_Down_Pile'))), ...
    ', #FU: ',num2str(length(tokIDs('pDP_Draw_Face_Up_Pile'))),', FU Top:  ',topcard));
set(global_info.handles.DP_ErrorMsg,'String',strcat('#FD: ',num2str(length(tokIDs('pDP_Draw_Face_Down_Pile'))), ...
    ', #FU: ',num2str(length(tokIDs('pDP_Draw_Face_Up_Pile'))),', FU Top:  ',topcard));
