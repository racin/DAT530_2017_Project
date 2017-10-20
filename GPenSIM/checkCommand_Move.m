function [ doCommand ] = checkCommand_Move( command, source )

global global_info;

if(isempty(strfind(command,'FP')) && isempty(strfind(command,'TP'))),
    disp('INVALID MOVE COMMAND!');
    doCommand = false;
    return;
end
doCommand = true;
return;

