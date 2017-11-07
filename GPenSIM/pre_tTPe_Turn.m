function [fire, transition] = pre_tTPe_Turn(transition)

fire = 0;
moveToken = tokenArrivedLate('pMC_TP_Turn',1);
[tableau, ~, ~, ~, ~, ~] = get_tableau_num_from_transname(transition.name);
moveCmd = get_color('pMC_TP_Turn',moveToken);

disp(strcat('TP ',tableau,' Turn trigger'));
disp(length(moveCmd));
disp(moveCmd{1});

if(length(moveCmd) >= 1 && strcmp(moveCmd{1},strcat('Turn:TP',tableau))),
    if ~isempty(tokIDs(strcat('pTP_',tableau,'_FaceUp_Pile'))) || ...
            isempty(tokIDs(strcat('pTP_',tableau,'_FaceDown_Pile'))),
        return;
    end;
    disp('Turn trigger. Woop');
    topCard = tokenArrivedLate(strcat('pTP_',tableau,'_FaceDown_Pile'),1);
    transition.selected_tokens = topCard;
    color = get_color(strcat('pTP_',tableau,'_FaceDown_Pile'), topCard);
    transition.new_color = color{1};
    transition.override = 1;
    fire = 1;
end