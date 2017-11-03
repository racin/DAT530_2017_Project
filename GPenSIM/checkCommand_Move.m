function [ doCommand, cmdDest, card ] = checkCommand_Move( command, destination, source, handle_err)

global global_info;
[moveCmd, card] = splitCommand(command);
cmdDest = moveCmd{2};

doCommand = false;
if length(cmdDest) < 3,
    set_handle(handle_err,'String','INCOMPLETE COMMAND');
    return;
elseif isempty(strfind(cmdDest,'FP')) && isempty(strfind(cmdDest,'TP')),
    set_handle(handle_err,'String','INVALID MOVE COMMAND');
    return;
end


% Foundation Piles
 if ~isempty(strfind(cmdDest,'FP')),
    if ~isempty(destination) && destination(1) ~= cmdDest(3),
        return;
    end;
    movedCard_split = strsplit(card,'_');
    moved_suit = movedCard_split(1);
    moved_rank = movedCard_split(2);
    if(~isfield(global_info.SUITS,cmdDest(3))),
        set_handle(handle_err,'String','INVALID SUIT');
        return;
    end;
    if moved_suit{1} ~= cmdDest(3),
        set_handle(handle_err,'String','INVALID LOCATION');
        return;
    end;
    global_suit = global_info.SUITS.(cmdDest(3));
    fp_Pile = strcat('pFP_',global_suit(1),'_Pile');
    if(iscell(fp_Pile)),
        fp_Pile = fp_Pile{1};
    end;
    dest_topCard_Id = tokenArrivedLate(fp_Pile,1);
    moved_rank_value = global_info.CARDVALUE_MAP(moved_rank{1});
    if dest_topCard_Id,
        dest_topCard_Color = get_color(fp_Pile,dest_topCard_Id);
        dest_topCard_split = strsplit(dest_topCard_Color{1},'_');
        dest_topCard_Suit = dest_topCard_split(1);
        dest_topCard_Rank = dest_topCard_split(2);
        diffRank = moved_rank_value - global_info.CARDVALUE_MAP(dest_topCard_Rank{1});
        if(diffRank ~= 1), % Added card must be 1 value higher than the current card.
            set_handle(handle_err,'String','INVALID CARD VALUE');
            return;
        end;
    elseif moved_rank_value ~= 1,
        set_handle(handle_err,'String','FIRST CARD MUST BE ACE');
        return;
    end;
end;

% Tableau Piles
 if ~isempty(strfind(cmdDest,'TP')),
    tableau_dest = cmdDest(3);
    
    if ~ismember(tableau_dest, {'1','2','3','4','5','6','7'}),
        set_handle(handle_err,'String','INVALID PILE');
        return
    end;
    if ~isempty(destination) == 1 && destination(1) ~= tableau_dest,
        return;
    end;
    movedCard_split = strsplit(card,'_');
    moved_suit = movedCard_split(1);
    moved_rank = movedCard_split(2);

    disp('TABLEAU PILE');
    disp(moved_suit);
    tp_Pile_Dest = strcat('pTP_',tableau_dest,'_FaceUp_Pile');
    
    
    if(iscell(tp_Pile_Dest)),
        tp_Pile_Dest = tp_Pile_Dest{1};
    end;
    disp(moveCmd);
    % Do not check amount once the command has reached it's destination.
    if length(moveCmd) >= 4 && ~isempty(source),
        if ~isempty(strfind(moveCmd{3},'TP')),
            tableau_src = moveCmd{3};
            tableau_src = tableau_src(3);
            tp_Pile_Src = strcat('pTP_',tableau_src,'_FaceUp_Pile');
            if(iscell(tp_Pile_Src)),
                tp_Pile_Src = tp_Pile_Src{1};
            end;
        else,
            set_handle(handle_err,'String','INVALID MOVE COMMAND');
            return;
        end
        amount = str2double(moveCmd{4});
        disp(strcat('AMOUNT:',{' '},num2str(amount)));
        disp(strcat('LenTokIds:',{' '},num2str(length(tokIDs(tp_Pile_Src)))));
        disp(strcat('SRCtoken: ',tp_Pile_Src));
        if amount > length(tokIDs(tp_Pile_Src)) || amount < 1,
            set_handle(handle_err,'String','INVALID AMOUNT');
            return;
        end;
    else,
        amount = 1;
    end
    dest_topCard_Id = tokenArrivedLate(tp_Pile_Dest,amount);
    dest_topCard_Id = dest_topCard_Id(amount);
    moved_rank_value = global_info.CARDVALUE_MAP(moved_rank{1});
    if dest_topCard_Id,
        dest_topCard_Color = get_color(tp_Pile_Dest,dest_topCard_Id);
        dest_topCard_split = strsplit(dest_topCard_Color{1},'_');
        dest_topCard_Suit = dest_topCard_split(1);
        dest_topCard_Rank = dest_topCard_split(2);
        
        moved_global_suit = global_info.SUITS.(moved_suit{1});
        dest_global_suit = global_info.SUITS.(dest_topCard_Suit{1});
        
        diffRank = moved_rank_value - global_info.CARDVALUE_MAP(dest_topCard_Rank{1});
        if(diffRank ~= -1),  % Added card must be 1 value lower than the current card.
            set_handle(handle_err,'String','INVALID CARD VALUE');
            return;
        end;
        if(strcmp(moved_global_suit{2},dest_global_suit{2})), % Moved and current suit color must be different (red/black).
            set_handle(handle_err,'String','SUIT COLOR MUST BE ALTERNATING');
            return;
        end;
    elseif moved_rank_value ~= 13,
        set_handle(handle_err,'String','FIRST CARD MUST BE KING');
        return;
    end;
end;
% strcmp(source,'DP') && 
% Foundation Pile - Diamonds
if ~isempty(source),
    global_info.last_command_source = source;
end;
set_handle(handle_err,'String','');
doCommand = true;
return;

