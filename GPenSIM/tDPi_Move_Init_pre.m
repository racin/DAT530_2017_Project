function [fire, transition] = tDPi_Move_Init(transition)

global global_info;

fire = 0;
% TODO: Set correct move command.
if ~isempty(global_info.INITIAL_DEAL_MOVE),
    transition.new_color = strcat('Move:TP',num2str(global_info.INITIAL_DEAL_MOVE{1}),':DP'); 
    global_info.INITIAL_DEAL_MOVE(1) = []; % Remove this card from the array
    fire = 1;
    return;
end;