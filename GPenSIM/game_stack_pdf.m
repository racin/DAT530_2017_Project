function [png] = game_stack_pdf() 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: client_pdf.m : Definition of client
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

png.PN_name = 'Game stack';

png.set_of_Ps = {'pGameStack'};
png.set_of_Ts = {'tDealer','tGSOut'}; 
png.set_of_As = {'tDealer','pGameStack',1,'pGameStack','tGSOut',1};
