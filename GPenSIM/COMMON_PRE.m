function [fire, transition] = COMMON_PRE(transition)

if ismember(transition.name, {'tFPe_Clubs_Add', 'tFPe_Diamonds_Add', ...
        'tFPe_Hearts_Add', 'tFPe_Spades_Add'}),
    [fire, transition] = pre_tFPe_Add(transition);
elseif ismember(transition.name, {'tFPe_Clubs_Move', 'tFPe_Diamonds_Move', ...
        'tFPe_Hearts_Move', 'tFPe_Spades_Move'}),
    [fire, transition] = pre_tFPe_Move(transition);
elseif ismember(transition.name, {'tPe_FP_Clubs_Move', 'tPe_FP_Diamonds_Move', ...
        'tPe_FP_Hearts_Move', 'tPe_FP_Spades_Move'}),
    [fire, transition] = pre_tPe_FP_Move(transition);
elseif ismember(transition.name, {'tPe_FP_Clubs_Out', 'tPe_FP_Diamonds_Out', ...
        'tPe_FP_Hearts_Out', 'tPe_FP_Spades_Out'}),
    [fire, transition] = pre_tFPe_Out(transition);
elseif ismember(transition.name, {'tTPe_1_Add_FaceDown', 'tTPe_2_Add_FaceDown', ...
        'tTPe_3_Add_FaceDown', 'tTPe_4_Add_FaceDown', 'tTPe_5_Add_FaceDown', ...
        'tTPe_6_Add_FaceDown', 'tTPe_7_Add_FaceDown'}),
    [fire, transition] = pre_tTPe_Add_FaceDown(transition);
elseif ismember(transition.name, {'tTPe_1_Add_FaceUp', 'tTPe_2_Add_FaceUp', ...
        'tTPe_3_Add_FaceUp', 'tTPe_4_Add_FaceUp', 'tTPe_5_Add_FaceUp', ...
        'tTPe_6_Add_FaceUp', 'tTPe_7_Add_FaceUp'}),
    [fire, transition] = pre_tTPe_Add_FaceUp(transition);
elseif ismember(transition.name, {'tTPe_1_Add_FaceUp', 'tTPe_2_Add_FaceUp', ...
        'tTPe_3_Add_FaceUp', 'tTPe_4_Add_FaceUp', 'tTPe_5_Add_FaceUp', ...
        'tTPe_6_Add_FaceUp', 'tTPe_7_Add_FaceUp'}),
    [fire, transition] = pre_tTPe_Add_FaceUp(transition);
elseif ismember(transition.name, {'tPe_TP_1_Turn', 'tPe_TP_2_Turn', ...
        'tPe_TP_3_Turn', 'tPe_TP_4_Turn', 'tPe_TP_5_Turn', ...
        'tPe_TP_6_Turn', 'tPe_TP_7_Turn'}),
    [fire, transition] = pre_tPe_TP_Turn(transition);
elseif ismember(transition.name, {'tTPe_1_Turn', 'tTPe_2_Turn', ...
        'tTPe_3_Turn', 'tTPe_4_Turn', 'tTPe_5_Turn', ...
        'tTPe_6_Turn', 'tTPe_7_Turn'}),
    [fire, transition] = pre_tTPe_Turn(transition);
elseif ismember(transition.name, {'tPe_TP_1_Move', 'tPe_TP_2_Move', ...
        'tPe_TP_3_Move', 'tPe_TP_4_Move', 'tPe_TP_5_Move', ...
        'tPe_TP_6_Move', 'tPe_TP_7_Move'}),
    [fire, transition] = pre_tPe_TP_Move(transition);
elseif ismember(transition.name, {'tTPe_1_Move', 'tTPe_2_Move', ...
        'tTPe_3_Move', 'tTPe_4_Move', 'tTPe_5_Move', ...
        'tTPe_6_Move', 'tTPe_7_Move'}),
    [fire, transition] = pre_tTPe_Move(transition);
elseif ismember(transition.name, {'tTPe_1_Out', 'tTPe_2_Out', ...
        'tTPe_3_Out', 'tTPe_4_Out', 'tTPe_5_Out', ...
        'tTPe_6_Out', 'tTPe_7_Out'}),
    [fire, transition] = pre_tTPe_Out(transition);
elseif ismember(transition.name, {'tTPe_1_Move_Multiple', 'tTPe_2_Move_Multiple', ...
        'tTPe_3_Move_Multiple', 'tTPe_4_Move_Multiple', 'tTPe_5_Move_Multiple', ...
        'tTPe_6_Move_Multiple', 'tTPe_7_Move_Multiple'}),
    [fire, transition] = pre_tTPe_Move_Multiple(transition);
else
    fire = 1;
end

end