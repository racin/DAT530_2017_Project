function [fire, transition] = tDealer_pre(transition)

global global_info;


if ~isempty(global_info.DECK),
    card = randi([1,length(global_info.DECK)]);
    transition.new_color = global_info.DECK(card);
    global_info.DECK(card) = []; % Remove this card from the array
    fire = 1;
    return;
end;
fire = 0;