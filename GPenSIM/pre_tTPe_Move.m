function [fire, transition] = pre_tTPe_Move(transition)

% TODO: If fire = 1, then set variable equal to amount and de-increment it
% in the post_fire file! Want to keep logic outside of player.
disp(strcat(transition.name,{' '},' move trigger!'));
fire = 0;
% moveToken = tokenArrivedLate('pMC_TP_Turn',1);
% if moveToken,
%     disp('TP 1 Turn trigger');
%     moveCmd = get_color('pMC_TP_Turn',moveToken);
%     disp(length(moveCmd));
%     if(length(moveCmd) >= 1 && strcmp(moveCmd{1},'Turn:TP1')),
%         disp('Turn trigger. Woop');
%         transition.selected_tokens = tokenArrivedLate('pTP_1_FaceDown_Pile',1);
%         fire = 1;
%     end
% end