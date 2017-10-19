function [] = tDPi_Enable_FP_Trans_post(transition)

disp('Enabling Flip Pile!');
global global_info;
global_info.DP_Flip_Pile_Running = true;