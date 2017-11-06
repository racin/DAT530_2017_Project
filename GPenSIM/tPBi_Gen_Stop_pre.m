function [fire, transition] = tPBi_Gen_pre(transition)

global global_info;
fire = 0;
if ~global_info.BOT_ENABLED,
    fire = 1;
end;