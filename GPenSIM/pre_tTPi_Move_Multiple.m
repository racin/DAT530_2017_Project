function [fire, transition] = pre_tTPi_Move_Multiple(transition)

global global_info;
fire = 0;

if global_info.TP_Move_Multi_Gen_Tokens > 0,
    transition.new_color = global_info.TP_Move_LastCmd;
    transition.override = 1;
    fire = 1;
end;