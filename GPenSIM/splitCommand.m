function [command, card] = splitCommand( tokenColors )

color_1 = tokenColors{1};
if length(tokenColors) == 2,
    color_2 = tokenColors{2};
else,
    color_2 = '0';
end;
if contains(color_1,'Move:'),
    command = strsplit(color_1,':');
    card = color_2;
else,
    command = strsplit(color_2,':');
    card = color_1;
end;

