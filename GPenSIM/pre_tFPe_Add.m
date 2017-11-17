function [fire, transition] = pre_tFPe_Add(transition)

global global_info;
fire = 0;
moveToken = tokenArrivedEarly('pMC_Out_Buffer',1);
tokenColor = get_color('pMC_Out_Buffer',moveToken);
if(length(tokenColor) ~= 2),
    return;
end;
[~, suit, handle_err] = get_suit_from_transname(transition.name);
[doCommand, cmdDest, card, cmdSource] = ...
    checkCommand_Move(tokenColor,suit,'',handle_err);
if(doCommand),
    transition.selected_tokens = moveToken;
    transition.new_color = card;
    transition.override = 1;
    fire = 1;
    global_info.SCORE = global_info.SCORE + 10;
    if(global_info.DISP_CHANGES),
        disp(strcat('Moved card',{' '},card,{' '},'from',{' '},cmdSource,...
            {' '},'to',{' '},cmdDest));
    end;
end