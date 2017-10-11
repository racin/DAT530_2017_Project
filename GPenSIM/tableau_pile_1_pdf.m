function [png] = tableau_pile_1_pdf() 
modname = '1';
png.PN_name = strcat('Tableau Pile - ',modname);


png.set_of_Ps = {strcat('pTP_',modname,'_Face_Up_Pile'),strcat('pTP_',modname,'_Face_Down_Pile'),strcat('pTP_',modname,'_Move')};
png.set_of_Ts = {strcat('tTPe_',modname,'_Add_Face_Up'),strcat('tTPe_',modname,'_Add_Face_Down'),strcat('tTPe_',modname,'_Move'), ...
    strcat('tPEe_',modname,'_Turn'),strcat('tTPe_',modname,'_Out')}; 
png.set_of_As = {
    strcat('tTPe_',modname,'_Add_Face_Up'),strcat('pTP_',modname,'_Face_Up_Pile'),1, ...
    strcat('tTPe_',modname,'_Add_Face_Down'),strcat('pTP_',modname,'_Face_Down_Pile'),1, ...
    strcat('tPEe_',modname,'_Turn'),strcat('pTP',modname,'_Face_Up_Pile'),1, ...
    strcat('pTP_',modname,'_Face_Down_Pile'), strcat('tPEe_',modname,'_Turn'), 1, ...
    strcat('pTP_',modname,'_Face_Up_Pile'), strcat('tTPe_',modname,'_Move'), 1, ...
    strcat('tTPe_',modname,'_Move'), strcat('pTP_',modname,'_Move'), 1 ...
    strcat('pTP_',modname,'_Move'), strcat('tTPe_',modname,'_Out'), 1, ...
    };
