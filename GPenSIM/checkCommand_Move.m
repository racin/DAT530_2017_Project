function [ doCommand ] = checkCommand_Move( command, source, movedCard)

global global_info;
doCommand = false;
if(isempty(strfind(command,'FP')) && isempty(strfind(command,'TP'))),
    set(global_info.handles.DP_ErrorMsg,'String','INVALID MOVE COMMAND!');
    return;
end

% Foundation Piles
if ~isempty(strfind(command,'FP')),
    disp(movedCard{1});
    movedCard_split = strsplit(movedCard{1},'_');
    moved_suit = movedCard_split(1);
    moved_rank = movedCard_split(2);
    if(~isfield(global_info.SUITS,moved_suit)),
        set(global_info.handles.DP_ErrorMsg,'String','INVALID SUIT');
        return;
    end;
    disp(moved_suit);
    global_suit = getfield(global_info.SUITS,moved_suit{1});
    fp_Pile = strcat('pFP_',global_suit(1),'_Pile');
    dest_topCard_Id = tokenArrivedLate(fp_Pile{1},1);
    dest_topCard_Color = '';
    if dest_topCard_Id,
        dest_topCard_Color = get_color(fp_Pile{1},dest_topCard_Id);
    end;
    if(dest_topCard_Color),
        dest_topCard_split = strsplit(dest_topCard_Color,'_');
        dest_topCard_Suit = dest_topCard_split(1);
        dest_topCard_Rank = dest_topCard_split(2);
        diffRank = global_info.CARDVALUE_MAP(moved_rank{1}) - global_info.CARDVALUE_MAP(dest_topCard_Rank{1});
        if(diffRank ~= 1),
            set(global_info.handles.DP_ErrorMsg,'String','INVALID CARD VALUE');
            return;
        end;
    end
    
end
% strcmp(source,'DP') && 
% Foundation Pile - Diamonds
set(global_info.handles.DP_ErrorMsg,'String','');
doCommand = true;
return;

