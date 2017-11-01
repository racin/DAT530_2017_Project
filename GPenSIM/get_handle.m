function [value] = get_handle(Handle, PropertyName)
    % Extend Matlab SET command to first check if GUI is enabled.
    % GET(H,'PropertyName')
    global global_info;
    if global_info.GUI_ENABLED,
        value = get(global_info.handles.(Handle),PropertyName);
    else,
        value = 0;
    end;
end