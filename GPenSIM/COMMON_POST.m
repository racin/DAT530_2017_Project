function [] = COMMON_POST(transition)

global global_info;

if ismember(transition.name, {'tTPe_1_Add_FaceDown'}),
    release('tPe_DP_Move');
% Release playerAction resource to allow for another player action.
elseif ismember(transition.name, {'tFPe_Clubs_Add','tFPe_Diamonds_Add', ...
        'tFPe_Hearts_Add','tFPe_Spades_Add', 'tTPe_1_Add_FaceUp', 'tTPe_1_Turn', ...
        'tTPe_1_Move'}),
    release(global_info.last_command_source);
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

