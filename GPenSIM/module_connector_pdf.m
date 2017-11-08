function [png] = module_connector_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: module_connector_pdf.m : Handles the connections of the modules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

png.PN_name = 'Module connector';

png.set_of_Ps = {'pMC_Out_Buffer', 'pMC_DP_Turn', 'pMC_DP_Move', ...
    'pMC_TP_Turn', 'pMC_TP_Move', 'pMC_FP_Move'};
png.set_of_Ts = {'tMC_Out_Buffer_Siphon', 'tMC_DP_Move_Siphon', ...
    'tMC_TP_Turn_Siphon', 'tMC_TP_Move_Siphon', 'tMC_FP_Move_Siphon'};
png.set_of_As = {
    'tDPe_Out', 'pMC_Out_Buffer', 1, ...
    'pMC_DP_Turn', 'tDPe_Turn', 1, ...
    'pMC_DP_Move', 'tDPe_Move', 1, ...
    'pMC_Out_Buffer', 'tMC_Out_Buffer_Siphon', 1, ...
    'pMC_DP_Move', 'tMC_DP_Move_Siphon', 1, ...
    'pMC_TP_Turn', 'tMC_TP_Turn_Siphon', 1, ...
    'pMC_TP_Move', 'tMC_TP_Move_Siphon', 1, ...
    'pMC_FP_Move', 'tMC_FP_Move_Siphon', 1, ...
    };
% Add connections to all 7 tableau piles %
for i = 1:7
    num = num2str(i);
    png.set_of_As = [png.set_of_As, {strcat('tTPe_',num,'_Out'),'pMC_Out_Buffer', 1}];
    png.set_of_As = [png.set_of_As, {'pMC_Out_Buffer',strcat('tTPe_',num,'_Add_FaceDown'), 1}];
    png.set_of_As = [png.set_of_As, {'pMC_Out_Buffer',strcat('tTPe_',num,'_Add_FaceUp'), 1}]; % Moving cards from one TP to another
    png.set_of_As = [png.set_of_As, {'pMC_TP_Move',strcat('tTPe_',num,'_Move'), 1}];
    png.set_of_As = [png.set_of_As, {'pMC_TP_Turn',strcat('tTPe_',num,'_Turn'), 1}];
end;

% Add connections to all 4 foundation piles %
foundationpiles = {'Spades','Hearts','Diamonds','Clubs'};
for i = 1:4
    fp = foundationpiles(i);
    png.set_of_As = [png.set_of_As, {strcat('tFPe_',fp{1},'_Out'),'pMC_Out_Buffer', 1}];
    png.set_of_As = [png.set_of_As, {'pMC_Out_Buffer',strcat('tFPe_',fp{1},'_Add'), 1}];
    png.set_of_As = [png.set_of_As, {'pMC_FP_Move',strcat('tFPe_',fp{1},'_Move'), 1}];
end;