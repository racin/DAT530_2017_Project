function [] = set_handle(Handle, PropertyName, PropertyValue)
    % Extend Matlab SET command to first check if GUI is enabled.
    % SET(H,'PropertyName',PropertyValue)
    global global_info;
    if global_info.GUI_ENABLED,
        set(Handle,PropertyName,PropertyValue);
    end;
end