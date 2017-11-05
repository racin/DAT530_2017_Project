function [fire, transition] = tDPi_Dealer_pre(transition)

global global_info;
fire = 0;
if ~isempty(global_info.DECK),
    if global_info.RANDOM_DECK,
        card = randi([1,length(global_info.DECK)]);
    else,
        card = 1;
    end;
    transition.new_color = global_info.DECK(card);
    global_info.DECK(card) = []; % Remove this card from the array
    fire = 1;
end;
