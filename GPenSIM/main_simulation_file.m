% Example-20-01: Modular Model Building
clear all; clc;

global global_info;
global_info.LOOP_NUMBER = 1;
global_info.STOP_AT = 110000;
global_info.DELTA_TIME = 100;
global_info.UNDEALT_DECK = {'D_A','D_2','D_3','D_4','D_5','D_6','D_7','D_8','D_9','D_X','D_J','D_Q','D_K', ...
    'C_A','C_2','C_3','C_4','C_5','C_6','C_7','C_8','C_9','C_X','C_J','C_Q','C_K', ...
    'H_A','H_2','H_3','H_4','H_5','H_6','H_7','H_8','H_9','H_X','H_J','H_Q','H_K', ...
    'S_A','S_2','S_3','S_4','S_5','S_6','S_7','S_8','S_9','S_X','S_J','S_Q','S_K'};
global_info.SUITS.D = {'Diamond','Red'};
global_info.SUITS.C = {'Clubs','Black'};
global_info.SUITS.H = {'Hearts','Red'};
global_info.SUITS.S = {'Spades','Black'};

%%%% COMPOSE STATIC GRAPH %%%%%%%
pns = pnstruct({'game_stack_pdf'});

%%%% DYNAMIC DETAILS %%%%
dyn.m0 = {};
dyn.ft = {'allothers',1}; 

pni = initialdynamics(pns, dyn); 

%%%% SUIMULATE %%%%%
sim = gpensim(pni);
%prnss(sim);
prnfinalcolors(sim)

