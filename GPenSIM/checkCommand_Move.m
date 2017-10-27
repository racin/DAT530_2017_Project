function [ doCommand, moveCmd, card ] = checkCommand_Move( command, destination, source, errhandle)

[moveCmd, card] = splitCommand(command);
moveCmd = moveCmd{2};
global global_info;
doCommand = false;
if(isempty(strfind(moveCmd,'FP')) && isempty(strfind(moveCmd,'TP'))),
    set(errhandle,'String','INVALID MOVE COMMAND!');
    return;
end

% Foundation Piles
if ~isempty(strfind(moveCmd,'FP')),
    disp(destination);
    if ~isempty(destination) && destination(1) ~= moveCmd(3),
        return;
    end;
    movedCard_split = strsplit(card,'_');
    moved_suit = movedCard_split(1);
    moved_rank = movedCard_split(2);
    if(~isfield(global_info.SUITS,moveCmd(3))),
        set(errhandle,'String','INVALID SUIT');
        return;
    end;
    if moved_suit{1} ~= moveCmd(3),
        set(errhandle,'String','INVALID LOCATION');
        return;
    end;
    %if isempty(destination),
        global_suit = getfield(global_info.SUITS,moveCmd(3));
        fp_Pile = strcat('pFP_',global_suit(1),'_Pile');
%     else,
%         global_suit = getfield(global_info.SUITS,destination(1));
%         fp_Pile = strcat('pFP_',destination,'_Pile');
%     end
    if(iscell(fp_Pile)),
        fp_Pile = fp_Pile{1};
    end;
    dest_topCard_Id = tokenArrivedLate(fp_Pile,1);
    moved_rank_value = global_info.CARDVALUE_MAP(moved_rank{1});
    if dest_topCard_Id,
        dest_topCard_Color = get_color(fp_Pile,dest_topCard_Id);
        if(dest_topCard_Color{1}),
            dest_topCard_split = strsplit(dest_topCard_Color{1},'_');
            dest_topCard_Suit = dest_topCard_split(1);
            dest_topCard_Rank = dest_topCard_split(2);
            diffRank = moved_rank_value - global_info.CARDVALUE_MAP(dest_topCard_Rank{1});
            if(diffRank ~= 1),
                set(errhandle,'String','INVALID CARD VALUE');
                return;
            end;
        end;
    elseif moved_rank_value ~= 1,
        set(errhandle,'String','FIRST CARD MUST BE ACE');
        return;
    end;
end
% strcmp(source,'DP') && 
% Foundation Pile - Diamonds
if ~isempty(source),
    global_info.last_command_source = source;
end;
set(errhandle,'String','');
doCommand = true;
return;

