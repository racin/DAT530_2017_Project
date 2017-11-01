function [png] = player_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: module_connector_pdf.m : Handles the connections of the modules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

png.PN_name = 'Player module';

png.set_of_Ps = {};
png.set_of_Ts = {'tPe_DP_Turn', 'tPe_DP_Move', 'tPe_TP_1_Turn', 'tPe_TP_1_Move',...
    'tPe_TP_2_Turn', 'tPe_TP_2_Move', 'tPe_TP_3_Turn', 'tPe_TP_3_Move', ...
    'tPe_TP_4_Turn', 'tPe_TP_4_Move', 'tPe_TP_5_Turn', 'tPe_TP_5_Move', ...
    'tPe_TP_6_Turn', 'tPe_TP_6_Move', 'tPe_TP_7_Turn', 'tPe_TP_7_Move', ...
    'tPe_FP_Clubs_Move', 'tPe_FP_Diamonds_Move', 'tPe_FP_Hearts_Move', 'tPe_FP_Spades_Move'}; 
png.set_of_As = {
    'tPe_DP_Turn', 'pMC_DP_Turn', 1, ... % Player module
    'tPe_DP_Move', 'pMC_DP_Move', 1, ... % Player module
    };

% Add connections to all 7 tableau piles %
for i = 1:7
    num = num2str(i);
    png.set_of_As = [png.set_of_As, {strcat('tPe_TP_',num,'_Turn'),'pMC_TP_Turn', 1}];
    png.set_of_As = [png.set_of_As, {strcat('tPe_TP_',num,'_Move'),'pMC_TP_Move', 1}];
end;

% Add connections to all 4 foundation piles %
foundationpiles = {'Clubs','Diamonds','Hearts','Spades'};
for i = 1:4
    fp = foundationpiles(i);
    png.set_of_As = [png.set_of_As, {strcat('tPe_FP_',fp{1},'_Move'),'pMC_FP_Move', 1}];
end;