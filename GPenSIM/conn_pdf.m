function [png] = conn_pdf() 
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File: conn_pdf.m: Definition of the connections between the modules
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

png.PN_name = 'Connections Profile module';
png.set_of_Ps = {};
png.set_of_Ts = {};
png.set_of_As = {'pSR','tCS',1,...    % client - internet
    'tCS','pRFC',1, ...             % internet - SIL
    'pRTC','tSC',1, ...             % SIL - internet
    'tSC','pRR',1,...               % internet - client
    'pB1','tIT',1,...               % init - iterations
    'tIT','pB1',1, ...              % iterations - init 
    'tIT','pB2',1,...               % iterations - strategy
    'pB3','tTD',1, ...              % strategy - tactical
    'tSUM','pB6',1,...              % tactical - iterations
    'tRES','pRTC',1,...             % iterations - SIL    
    };