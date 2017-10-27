function [png] = player_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: module_connector_pdf.m : Handles the connections of the modules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

png.PN_name = 'Player module';

png.set_of_Ps = {};
png.set_of_Ts = {'tPe_DP_Turn', 'tPe_DP_Move', 'tPe_TP_Turn', 'tPe_TP_Move', ...
    'tPe_FP_Diamonds_Move', 'tPe_FP_Hearts_Move', 'tPe_FP_Spades_Move', 'tPe_FP_Clubs_Move'}; 
png.set_of_As = {
    };