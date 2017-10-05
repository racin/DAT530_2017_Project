function [fire, transition] = tDealer_pre(transition)

global global_info;


if ~isempty(global_info.UNDEALT_DECK),
    card = randi([1,length(global_info.UNDEALT_DECK)]);
    transition.new_color = global_info.UNDEALT_DECK(card);
    global_info.UNDEALT_DECK(card) = []; % Remove this card from the array
    fire = 1;
    return;
end;
fire = 0;