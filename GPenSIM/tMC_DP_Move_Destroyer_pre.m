function [fire, transition] = tMC_DP_Move_Destroyer_pre(transition)

% Destroyer for the DP Move command. Should not attempt to move if there are
% no tokens in the FaceUp pile.
fire = 0;
if isempty(tokIDs('pDP_Draw_FaceUp_Pile')),
    fire = 1;
end