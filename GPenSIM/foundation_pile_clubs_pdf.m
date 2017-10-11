function [png] = foundation_pile_clubs_pdf() 
modname = 'clubs';
png.PN_name = strcat('Foundation Pile - ',modname);


png.set_of_Ps = {strcat('pFP_',modname,'_pile'),strcat('pFP_',modname,'_Move')};
png.set_of_Ts = {strcat('tFPe_',modname,'_Add'),strcat('tFPe_',modname,'_Move'),strcat('tFPe_',modname,'_Out')}; 
png.set_of_As = {
    strcat('tFPe_',modname,'_Add'),strcat('pFP_',modname,'_pile'),1, ...
    strcat('pFP_',modname,'_pile'),strcat('tFPe_',modname,'_Out'),1, ...
    strcat('tFPe_',modname,'_Move'), strcat('pFP_',modname,'_Move'), 1, ...
    strcat('pFP_',modname,'_Move'), strcat('tFPe_',modname,'_Out'), 1, ...
    };
