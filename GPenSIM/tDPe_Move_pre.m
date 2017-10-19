function [fire, transition] = tDPe_Move_pre(transition)


global global_info;
moveToken = tokenArrivedEarly('pMC_DP_Move',1);
tokenColor = get_color('pMC_DP_Move', moveToken);
disp(tokenColor);
disp(isempty(strfind(tokenColor,'FP')));
disp(strfind(tokenColor,'FP'));
disp(isempty(strfind(tokenColor,'TP')));
disp(strfind(tokenColor,'TP'));
if(isempty(strfind(tokenColor,'FP')) && isempty(strfind(tokenColor,'TP'))),
    disp('INVALID MOVE COMMAND!');
    fire = 0;
    return;
end
transition.selected_tokens = moveToken;
disp(strcat('sMove token color: ', tokenColor));
fire = 1;