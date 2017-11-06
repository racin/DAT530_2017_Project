function [] = COMMON_POST(transition)

global global_info;

% Release playerAction resource to allow for another player action.
if ismember(transition.name, {'tTPe_1_Add_FaceDown', 'tTPe_2_Add_FaceDown', ...
        'tTPe_3_Add_FaceDown', 'tTPe_4_Add_FaceDown', 'tTPe_5_Add_FaceDown', ...
        'tTPe_6_Add_FaceDown', 'tTPe_7_Add_FaceDown'}),
    global_info.CARDS_DEALT = global_info.CARDS_DEALT + 1;
elseif ismember(transition.name, {'tTPe_1_Add_FaceUp', 'tTPe_2_Add_FaceUp', ...
        'tTPe_3_Add_FaceUp', 'tTPe_4_Add_FaceUp', 'tTPe_5_Add_FaceUp', ...
        'tTPe_6_Add_FaceUp', 'tTPe_7_Add_FaceUp'}),
    global_info.CARDS_DEALT = global_info.CARDS_DEALT + 1;
    if global_info.TP_Move_Multiple_Count <= 1,
        if isfield(global_info,'last_command_source'),
            disp('RELEASING RESOURCE');
            disp(global_info.last_command_source);
            release(global_info.last_command_source);
        end
    else,
        disp('MOVING MULTIPLE');
        disp(global_info.last_command_source);
        global_info.TP_Move_Multiple_Count = global_info.TP_Move_Multiple_Count - 1;
        [tableau, ~, ~, ~, ~, ~] = get_tableau_num_from_transname(global_info.last_command_source);
        global_info.TP_Move_Multiple = tableau;
    end;
elseif ismember(transition.name, {
        'tFPe_Clubs_Add','tFPe_Diamonds_Add', ...
        'tFPe_Hearts_Add','tFPe_Spades_Add', ...
        'tTPe_1_Turn', 'tTPe_2_Turn',  ...
        'tTPe_3_Turn', 'tTPe_4_Turn', ...
        'tTPe_5_Turn', 'tTPe_6_Turn', ...
        'tTPe_7_Turn'}),
    release(global_info.last_command_source);
elseif ismember(transition.name, {
        'tPBe_DP_Move','tPBe_DP_Turn', 'tPBe_FP_Move','tPBe_TP_Move', ...
        'tPBe_TP_Turn',}),
    global_info.BOT_ACTIONS_NEW_CMD = 1;
end;

% Check if game is won. Win condition: 13 tokens on each of the foundation
% piles.
if(length(tokIDs('pFP_Clubs_Pile')) == 13 && length(tokIDs('pFP_Diamonds_Pile')) == 13 ...
        && length(tokIDs('pFP_Hearts_Pile')) == 13 && length(tokIDs('pFP_Spades_Pile')) == 13),
    disp('GAME WON!');
    global_info.STOP_SIMULATION = 1;
end;

% if length(tokIDs('pDP_Draw_FaceDown_Pile')+length(tokIDs('pDP_Draw_FaceUp_Pile')))) <= 24,
    if global_info.GUI_ENABLED,
        player_update_GUI();
    end
% end

