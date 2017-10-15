function [png] = player_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: module_connector_pdf.m : Handles the connections of the modules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global global_info;
global_info.DP_Turn_Btn = false;
global_info.DP_Move_Btn = false;

png.PN_name = 'Player module';

png.set_of_Ps = {};
png.set_of_Ts = {'tPe_DP_Turn', 'tPe_DP_Move', 'tPe_TP_Turn', 'tPe_TP_Move', 'tPe_FP_Move'}; 
png.set_of_As = {
    };