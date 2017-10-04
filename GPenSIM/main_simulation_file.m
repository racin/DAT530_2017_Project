% Example-20-01: Modular Model Building
clear all; clc;

global global_info;
global_info.LOOP_NUMBER = 1;
global_info.STOP_AT = 110000;
global_info.DELTA_TIME = 100;

%%%% COMPOSE STATIC GRAPH %%%%%%%
pns = pnstruct({'game_stack_pdf', 'foundation_stack_pdf', 'deck_pdf'});

%%%% DYNAMIC DETAILS %%%%
dyn.m0 = {};
dyn.ft = {'allothers',1}; 

pni = initialdynamics(pns, dyn); 

%%%% SUIMULATE %%%%%
sim = gpensim(pni);
prnss(sim);

