% Example-20-01: Modular Model Building
clear all; clc;

global global_info;
global_info.LOOP_NUMBER = 1;
global_info.STOP_AT = 110000;
global_info.DELTA_TIME = 100;

global_info.DECK = {'D_A','D_2','D_3','D_4','D_5','D_6','D_7','D_8','D_9','D_X','D_J','D_Q','D_K', ...
    'C_A','C_2','C_3','C_4','C_5','C_6','C_7','C_8','C_9','C_X','C_J','C_Q','C_K', ...
    'H_A','H_2','H_3','H_4','H_5','H_6','H_7','H_8','H_9','H_X','H_J','H_Q','H_K', ...
    'S_A','S_2','S_3','S_4','S_5','S_6','S_7','S_8','S_9','S_X','S_J','S_Q','S_K'};
global_info.SUITS.D = {'Diamond','Red'};
global_info.SUITS.C = {'Clubs','Black'};
global_info.SUITS.H = {'Hearts','Red'};
global_info.SUITS.S = {'Spades','Black'};
global_info.CARDVALUE_MAP = containers.Map({'A','2','3','4','5','6','7','8','9','X','J','Q','K'}, ...
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]);

%%%% COMPOSE STATIC GRAPH %%%%%%%
pns = pnstruct({
    'draw_pile_pdf'; % Game pile ...
    'player_pdf'; % Player
   % 'foundation_pile_spades_pdf'; % Foundation pile: Spades ...
   % 'foundation_pile_clubs_pdf' % Foundation pile: Clubs ...
    });

%%%% DYNAMIC DETAILS %%%%
dyn.m0 = {'pDP_Dealer',52};
dyn.ft = {'allothers',1}; 



%%%% TESTING %%%%
global_info.REAL_TIME = 1; % For testing
global_info.STOP_AT = current_clock(3)+[0 0 20];


%%%% SIMULATE %%%%%
player_GUI;
pni = initialdynamics(pns, dyn); 
sim = gpensim(pni);

%prnss(sim);
%prnfinalcolors(sim)


