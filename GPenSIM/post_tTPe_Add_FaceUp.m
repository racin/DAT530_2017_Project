function [] = post_tTPe_Add_FaceUp(transition)

global global_info;
global_info.CARDS_DEALT = global_info.CARDS_DEALT + 1;

if global_info.TP_Move_Multiple_Count <= 1,
    if isfield(global_info,'last_command_source'),
        release(global_info.last_command_source);
    end
else,
    global_info.TP_Move_Multiple_Count = global_info.TP_Move_Multiple_Count - 1;
end;