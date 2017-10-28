function [] = COMMON_POST(transition)

global global_info;

% Release playerAction resource to allow for another player action.
if ismember(transition.name, {'tFPe_Clubs_Add','tFPe_Diamonds_Add', ...
        'tFPe_Hearts_Add','tFPe_Spades_Add', 'tTPe_1_Add_FaceDown', ...
        'tTPe_1_Add_FaceUp'}),
    release(global_info.last_command_source);
end;

% Check if game is won. Win condition: 13 tokens on each of the foundation
% piles.
if(length(tokIDs('pFP_Clubs_Pile')) == 13 && length(tokIDs('pFP_Diamonds_Pile')) == 13 ...
        && length(tokIDs('pFP_Hearts_Pile')) == 13 && length(tokIDs('pFP_Spades_Pile')) == 13),
    disp('GAME WON!');
    global_info.STOP_SIMULATION = 1;
end;


player_update_GUI();
