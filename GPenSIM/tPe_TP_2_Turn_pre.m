function [fire, transition] = tPe_TP_1_Turn_pre(transition)

fire = 0;
global global_info;
[playerAction] = request(transition.name, {'playerAction', 1});
if global_info.TP_1_Turn_Btn ~= false && playerAction,
    global_info.TP_1_Turn_Btn = false;
    if ~isempty(tokIDs('pTP_1_FaceUp_Pile')),
        set_handle_handle(global_info.handles.TP_1_ErrorMsg,'String','FaceUp Pile must be empty');
        return;
    end;
    set_handle_handle(global_info.handles.TP_1_ErrorMsg,'String','');
    global_info.last_command_source = transition.name;
    disp('TP 1 Turn clicked!');
    transition.new_color = 'Turn:TP1';
    fire = 1;
end;