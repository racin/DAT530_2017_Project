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
    post_tTPe_Add_FaceUp(transition);
elseif ismember(transition.name, {
        'tFPe_Clubs_Add','tFPe_Diamonds_Add', 'tFPe_Hearts_Add', ...
        'tFPe_Spades_Add', 'tTPe_1_Turn', 'tTPe_2_Turn', 'tTPe_3_Turn', ...
        'tTPe_4_Turn', 'tTPe_5_Turn', 'tTPe_6_Turn', 'tTPe_7_Turn', ...
        'tMC_DP_Move_Siphon', 'tMC_FP_Move_Siphon', 'tMC_Out_Buffer_Siphon', ...
        'tMC_TP_Move_Siphon', 'tMC_TP_Turn_Siphon'}),
    release(global_info.last_command_source);
elseif ismember(transition.name, {
        'tPBe_DP_Move','tPBe_DP_Turn', 'tPBe_FP_Move','tPBe_TP_Move', ...
        'tPBe_TP_Turn',}),
    global_info.BOT_ACTIONS_NEW_CMD = 1;
elseif ismember(transition.name, {'tTPi_1_Move_Multiple', 'tTPi_2_Move_Multiple', ...
        'tTPi_3_Move_Multiple', 'tTPi_4_Move_Multiple', 'tTPi_5_Move_Multiple', ...
        'tTPi_6_Move_Multiple', 'tTPi_7_Move_Multiple'}),
    global_info.TP_Move_Multi_Gen_Tokens = global_info.TP_Move_Multi_Gen_Tokens - 1;
end;

% Check if game is won. Win condition: 13 tokens on each of the foundation
% piles.
if(length(tokIDs('pFP_Clubs_Pile')) == 13 && length(tokIDs('pFP_Diamonds_Pile')) == 13 ...
        && length(tokIDs('pFP_Hearts_Pile')) == 13 && length(tokIDs('pFP_Spades_Pile')) == 13),
    set_handle('GameStatus', 'String', 'GAME WON!');
    disp('GAME WON!');
    global_info.STOP_SIMULATION = 1;
end;

if global_info.CARDS_DEALT >= global_info.INITIAL_DEAL_MOVE_LENGTH,
    if global_info.GUI_ENABLED,
        player_update_GUI();
    end
end

