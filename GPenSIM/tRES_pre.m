function [fire, trans] = tRES_pre (trans)
% function [fire, trans] = tRES_pre (trans)

% global PN;
% PN
p1 = get_place('pNOI');
fire =  (p1.tokens == 0);
