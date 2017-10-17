function [png] = module_connector_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: module_connector_pdf.m : Handles the connections of the modules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

png.PN_name = 'Module connector';

png.set_of_Ps = {'pMC_DP_Out', 'pMC_TP_Out', 'pMC_FP_Out', 'pMC_DP_Turn', ...
    'pMC_DP_Move', 'pMC_TP_Turn', 'pMC_TP_Move', 'pMC_FP_Move'};
png.set_of_Ts = {}; 
png.set_of_As = {
    'tDPe_Out', 'pMC_DP_Out', 1, ...
    'tPe_DP_Turn', 'pMC_DP_Turn', 1, ...
    'tPe_DP_Move', 'pMC_DP_Move', 1, ...
    'tPe_TP_Turn', 'pMC_TP_Turn', 1, ...
    'tPe_TP_Move', 'pMC_TP_Move', 1, ...
    'tPe_FP_Move', 'pMC_FP_Move', 1, ...
    'pMC_DP_Turn', 'tDPe_Turn', 1, ...
    'pMC_DP_Move', 'tDPe_Move', 1, ...
    };
% Add connections to all 7 tableau piles %
for c = 1:1
    num = num2str(c);
    png.set_of_As = [png.set_of_As, {'pMC_DP_Out',strcat('tTPe_',num,'_Add_Face_Down'), 1}];
    png.set_of_As = [png.set_of_As, {'pMC_DP_Out',strcat('tTPe_',num,'_Add_Face_Up'), 1}];
    png.set_of_As = [png.set_of_As, {'pMC_FP_Out',strcat('tTPe_',num,'_Add_Face_Up'), 1}];
    png.set_of_As = [png.set_of_As, {'pMC_TP_Out',strcat('tTPe_',num,'_Add_Face_Up'), 1}]; % Moving cards from one TP to another
    png.set_of_As = [png.set_of_As, {strcat('tTPe_',num,'_Out'),'pMC_TP_Out', 1}];
end

% Add connections to all 4 foundation piles %
foundationpiles = {'spades','hearts','diamonds','clubs'};
for c = 1:4
    png.set_of_As = [png.set_of_As, {'pMC_DP_Out',strcat('tFPe_',foundationpiles(c),'_Add'), 1}];
    png.set_of_As = [png.set_of_As, {'pMC_TP_Out',strcat('tFPe_',foundationpiles(c),'_Add'), 1}];
    png.set_of_As = [png.set_of_As, {strcat('tFPe_',foundationpiles(c),'_Out'),'pMC_FP_Out', 1}];
end