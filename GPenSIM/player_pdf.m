function [png] = player_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: module_connector_pdf.m : Handles the connections of the modules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

png.PN_name = 'Player module';

png.set_of_Ps = {'pP_DP_Turn', 'pP_DP_Move', 'pP_TP_Turn', 'pP_TP_Move', 'pP_FP_Move'};
png.set_of_Ts = {}; 
png.set_of_As = {
    };