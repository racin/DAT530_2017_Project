function [png] = draw_pile_pdf() 
png.PN_name = 'Draw Pile';
global global_info;
global_info.DP_Flip_Pile_Running = false;

png.set_of_Ps = {'pDP_Draw_Face_Up_Pile','pDP_Draw_Face_Down_Pile', ...
    'pDP_Move_Out','pDP_Dealer', 'pDP_Turn'};
png.set_of_Ts = {'tDPi_Dealer','tDPe_Out','tDPe_Turn','tDPi_Turn', ...
    'tDPe_Move', 'tDPi_Enable_FP_Trans', 'tDPi_Flip_Pile'}; 
png.set_of_As = {
    'tDPi_Dealer','pDP_Draw_Face_Down_Pile',1, ...
    'pDP_Draw_Face_Up_Pile','tDPe_Out',1, ...
    'pDP_Dealer', 'tDPi_Dealer', 1, ...
    'pDP_Draw_Face_Down_Pile', 'tDPi_Turn', 1, ...
    'tDPi_Turn', 'pDP_Draw_Face_Up_Pile', 1, ...
    'pDP_Move_Out', 'tDPe_Out', 1, ...
    'tDPe_Move', 'pDP_Move_Out', 1, ...
    'pDP_Draw_Face_Up_Pile', 'tDPi_Flip_Pile', 1, ...
    'tDPi_Flip_Pile', 'pDP_Draw_Face_Down_Pile', 1, ...
    'pDP_Turn', 'tDPi_Enable_FP_Trans', 1, ...
    'pDP_Turn', 'tDPi_Turn', 1, ...
    'tDPe_Turn', 'pDP_Turn', 1, ...
    };
png.set_of_Is = {
    'pDP_Dealer', 'tDPe_Move', 1, ...
    'pDP_Dealer', 'tDPe_Turn', 1, ...
    'pDP_Draw_Face_Down_Pile', 'tDPi_Enable_FP_Trans', 1
    };