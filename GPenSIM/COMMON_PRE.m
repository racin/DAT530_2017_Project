function [fire, transition] = COMMON_PRE(transition)

if ismember(transition.name, {'tFPe_Clubs_Add', 'tFPe_Diamonds_Add', ...
        'tFPe_Hearts_Add', 'tFPe_Spades_Add'}),
    [fire, transition] = pre_tFPe_Add(transition);
    return;
end
if ismember(transition.name, {'tFPe_Clubs_Move', 'tFPe_Diamonds_Move', ...
        'tFPe_Hearts_Move', 'tFPe_Spades_Move'}),
    [fire, transition] = pre_tFPe_Move(transition);
    return;
end
if ismember(transition.name, {'tPe_FP_Clubs_Move', 'tPe_FP_Diamonds_Move', ...
        'tPe_FP_Hearts_Move', 'tPe_FP_Spades_Move'}),
    [fire, transition] = pre_tPe_FP_Move(transition);
    return;
end

fire = 1;
end