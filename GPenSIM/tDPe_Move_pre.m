function [fire, transition] = tDPe_Move_pre(transition)

fire = 0;
if ~isempty(tokIDs('pDP_Draw_FaceUp_Pile')),
    fire = 1;
end
