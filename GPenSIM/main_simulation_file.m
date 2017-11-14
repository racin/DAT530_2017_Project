% Solitaire main simulation file
clear all; clc;
global global_info;

%%%% SIMULATION SETTINGS %%%%
global_info.GUI_ENABLED = 1;
global_info.BOT_ENABLED = 1;
global_info.DISP_CHANGES = 1;
global_info.DELTA_TIME = 1;
global_info.MAX_LOOP = 10000;

%%%% GAME SETTINGS %%%%
% The bot generates a number from 1-100, this is number is used with the
% array below to determine which action is to be taken. The cutoffs are,
% DP_Turn, DP_Move, FP_Move, TP_Turn, TP_Move. Given array [20, 50, 70,
% 80], a number between 1-20 would attempt a DP_Turn action, 21-50 DP_Move,
% and so on.
global_info.BOT_ACTIONS = [10, 42, 44, 60];
% The probability of moving to a tableau pile versus a foundation pile.
global_info.BOT_ACTIONS_TP_FP = 15;
% The probability that the bot will attempt to move the full stack versus a
% part of it.
global_info.BOT_ACTIONS_TP_FULL_PARTIAL_MOVE = 35;

global_info.RANDOM_DECK = 0;
% First entry is bottom of the deck. Last entry is top of the deck.
global_info.DECK = {'D_A','D_2','D_3','D_4','D_5','D_6','D_7','D_8','D_9','D_X','D_J','D_Q','D_K', ...
    'C_A','C_2','C_3','C_4','C_5','C_6','C_7','C_8','C_9','C_X','C_J','C_Q','C_K', ...
    'H_A','H_2','H_3','H_4','H_5','H_6','H_7','H_8','H_9','H_X','H_J','H_Q','H_K', ...
    'S_A','S_2','S_3','S_4','S_5','S_6','S_7','S_8','S_9','S_X','S_J','S_Q','S_K'
    };
% To which Tableau pile the cards will be dealt. The first entry is to top
% of the deck (See global_info.DECK).
global_info.INITIAL_DEAL_MOVE = {
    '1', '2', '3', '4', '5', '6', '7', ...
    '2', '3', '4', '5', '6', '7', ...
    '3', '4', '5', '6', '7', ...
    '4', '5', '6', '7', ...
    '5', '6', '7', ...
    '6', '7', ...
    '7'};

global_info.SUITS.D = {'Diamonds','Red'};
global_info.SUITS.C = {'Clubs','Black'};
global_info.SUITS.H = {'Hearts','Red'};
global_info.SUITS.S = {'Spades','Black'};
global_info.CARDVALUE_MAP = containers.Map({'A','2','3','4','5','6','7','8','9','X','J','Q','K'}, ...
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]);
global_info.FP_PILES = {'FPC','FPD','FPH','FPS'};
global_info.TP_PILES = {'TP1','TP2','TP3','TP4','TP5','TP6','TP7'};
global_info.FP_TP_PILES = [global_info.FP_PILES, global_info.TP_PILES];

%%%% GLOBAL PARAMETERS %%%%
global_info.SCORE = 0;
global_info.TP_Move_Multiple = 0;
global_info.TP_Move_Multiple_Count = 0;
global_info.DP_Flip_Pile_Running = false;
global_info.CARDS_DEALT = 0;
global_info.INITIAL_DEAL_MOVE_LENGTH = length(global_info.INITIAL_DEAL_MOVE);
global_info.INITIAL_DECK_LENGTH = length(global_info.DECK);
global_info.BOT_ACTIONS_NEW_CMD = 1;
global_info.BOT_LAST_CMD = '';
global_info.BOT_NEXT_CMD = '';

%%%% COMPOSE STATIC GRAPH %%%%%%%
pn_struct = {
    'module_connector_pdf'; % Module connector ...
    'draw_pile_pdf'; % Game pile ...
    'foundation_pile_clubs_pdf'; % Foundation pile: Clubs ...
    'foundation_pile_diamonds_pdf' % Foundation pile: Diamonds ...
    'foundation_pile_hearts_pdf' % Foundation pile: Hearts ...
    'foundation_pile_spades_pdf' % Foundation pile: Spades ...
    'tableau_pile_1_pdf' % Tableau pile 1 ...
    'tableau_pile_2_pdf' % Tableau pile 2 ...
    'tableau_pile_3_pdf' % Tableau pile 3 ...
    'tableau_pile_4_pdf' % Tableau pile 4 ...
    'tableau_pile_5_pdf' % Tableau pile 5 ...
    'tableau_pile_6_pdf' % Tableau pile 6 ...
    'tableau_pile_7_pdf' % Tableau pile 7 ...
    };


if global_info.GUI_ENABLED,
    pn_struct{length(pn_struct) + 1} = 'player_pdf';
end;
if global_info.BOT_ENABLED,
    pn_struct{length(pn_struct) + 1} = 'player_bot_pdf';
end;
pns = pnstruct(pn_struct);
%%%% DYNAMIC DETAILS %%%%
% Only one resource in the PN. Used to symbolize that there is an ongoing
% action, so that a new one can not be started. This assures the atomicity
% and correctness of the system.
dyn.re = {'playerAction', 1, inf};

% Initial tokens.
disp(length(global_info.INITIAL_DEAL_MOVE))
dyn.m0 = {'pDP_Dealer', global_info.INITIAL_DECK_LENGTH, 'pDP_Turn', ...
    length(global_info.INITIAL_DEAL_MOVE), 'pDP_Move_Init', length(global_info.INITIAL_DEAL_MOVE)};

% Set priority on the initial move transition to be higher than all other
% transition in order to have a more natural ordering of cards.
dyn.ip = {'tDPe_Out', 10};
% Need to have some time to be able to fetch tokens based on time. (Which
% arrived earliest or latest).
dyn.ft = {'allothers', 0.01}; 
if global_info.BOT_ENABLED,
    %dyn.ft = [dyn.ft, 'tPBi_Gen', 1];
end;

if global_info.GUI_ENABLED,
    player_GUI;
end

%%%% SIMULATE %%%%%
pni = initialdynamics(pns, dyn); 
sim = gpensim(pni);

%prnss(sim);
prnfinalcolors(sim)


