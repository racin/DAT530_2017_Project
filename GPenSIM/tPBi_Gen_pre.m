function [fire, transition] = tPBi_Gen_pre(transition)

fire = 0;
global global_info;
if global_info.CARDS_DEALT < global_info.INITIAL_DEAL_MOVE_LENGTH,
    return;
end;
if global_info.BOT_ENABLED && global_info.BOT_ACTIONS_NEW_CMD,
    rndNum = randi(100);
    source = '';
    if rndNum <= global_info.BOT_ACTIONS(1) && ...
            ~strcmp(global_info.BOT_LAST_CMD,'DP_Turn'),
        action = 'DP_Turn';
    elseif rndNum <= global_info.BOT_ACTIONS(2) && ...
            ~strcmp(global_info.BOT_LAST_CMD,'DP_Move'),
        action = 'DP_Move';
    elseif rndNum <= global_info.BOT_ACTIONS(3) && ...
            ~strcmp(global_info.BOT_LAST_CMD,'FP_Move'),
        action = 'FP_Move';
        suits = {':C', ':D', ':H', ':S'};
        source = suits(randi(length(suits)));
    elseif rndNum <= global_info.BOT_ACTIONS(4) && ...
            ~strcmp(global_info.BOT_LAST_CMD,'TP_Turn'),
        action = 'TP_Turn';
        source = strcat(':',num2str(randi(7)));
    else
        action = 'TP_Move';
        source = strcat(':',num2str(randi(7)));
    end;

%         % Reset ongoing commands.
%         if ~strcmp(global_info.BOT_LAST_CMD,action),
%             disp('RESET MOVE CMD');
%         global_info.BOT_DP_MOVES = {'FPC','FPD','FPH','FPS','TP1','TP2',...
%             'TP3','TP4','TP5','TP6','TP7'};
        global_info.BOT_DP_MOVES = {'FPC','FPD','FPH','FPS'};
        global_info.BOT_FP_MOVES = {'TP1','TP2','TP3','TP4','TP5','TP6',...
            'TP7'};
        global_info.BOT_TP_MOVES = {'FPC','FPD','FPH','FPS','TP1','TP2',...
            'TP3','TP4','TP5','TP6','TP7'};
%         end;
    global_info.BOT_ACTIONS_NEW_CMD = 0;
    
    transition.new_color = strcat(action,source);
    transition.override = 1;
    fire = 1;
end;