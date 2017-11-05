function [fire, transition] = tDPi_Move_Init_pre(transition)

global global_info;

fire = 0;
if ~isempty(global_info.INITIAL_DEAL_MOVE),
    transition.new_color = strcat('Move:TP',num2str(global_info.INITIAL_DEAL_MOVE{1}),':DP'); 
    global_info.INITIAL_DEAL_MOVE(1) = [];
    fire = 1;
end;