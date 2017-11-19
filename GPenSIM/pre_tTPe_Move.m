function [fire, transition] = pre_tTPe_Move(transition)

global global_info;
fire = 0;
moveToken = tokenArrivedLate('pMC_TP_Move',1);
[tableau, ~, ~, ~, ~, ~]  = get_tableau_from_transname(transition.name);

moveColor = get_color('pMC_TP_Move',moveToken);
[moveCmd, ~] = splitCommand(moveColor);

if(length(moveCmd) >= 4 && strcmp(moveCmd{3},strcat('TP',tableau))),
    amount = str2double(moveCmd{4});
    global_info.TP_Move_Multiple_Count = amount;
    global_info.TP_Move_Multi_Gen_Tokens = amount - 1;
    
    transition.selected_tokens = moveToken;
    fire = 1;
end