function [] = initialdealing()
    global global_info;
    tim = timer('ExecutionMode','fixedRate','Period',0.1, 'TimerFcn',@initTurnCards,'TasksToExecute',11, 'BusyMode', 'queue');
    start(tim);
    %wait(tim);
    %disp('STARTING NEXT TIMER.');
    %tim = timer('ExecutionMode','fixedRate','Period',0.1, 'TimerFcn',@initMoveCards,'TasksToExecute',10, 'BusyMode', 'queue');
    %start(tim);
    %wait(tim);
end

function initTurnCards(obj, event)
    global global_info;
    global PN;
    
    if global_info.INITIAL_DEAL_TURNS == 10,
        disp('11th time');
        tim = timer('ExecutionMode','fixedRate','Period',0.1, 'TimerFcn',@initMoveCards,'TasksToExecute',10, 'BusyMode', 'queue');
        start(tim);
        return;
    end;
    % Only one resource used, thus we can check directly in the internal
    % data structure of the resource.
    dp_turn_trans = get_trans('tDPi_Turn');
    if PN.system_resources.instance_usage(1,1) ~= 0 || ...
            dp_turn_trans.times_fired < global_info.INITIAL_DEAL_TURNS,
        % Token is not available, some other started action must be
        % incomplete. Wait a bit and try again.
        
        disp('Resource is in use. Wait a bit and try again.');
        start(timer('ExecutionMode','fixedRate','StartDelay',0.1, 'TimerFcn',@initTurnCards,'TasksToExecute',1));
    else,
        % Move one card
        disp('Trying to turn.');
        global_info.INITIAL_DEAL_TURNS = global_info.INITIAL_DEAL_TURNS + 1;
        global_info.DP_Turn_Btn = true;
    end;
end

function initMoveCards(obj, event)
    global global_info;
    global PN;

    % Only one resource used, thus we can check directly in the internal
    % data structure of the resource.
    dp_move_trans = get_trans('tDPe_Move');
    disp(dp_move_trans.times_fired);
    disp(global_info.INITIAL_DEAL_MOVES);
    if PN.system_resources.instance_usage(1,1) ~= 0 || ...
            dp_move_trans.times_fired < global_info.INITIAL_DEAL_MOVES,
        % Token is not available, some other started action must be
        % incomplete. Wait a bit and try again.
        
        disp('Resource is in use. Wait a bit and try again.');
        start(timer('ExecutionMode','fixedRate','StartDelay',2, 'TimerFcn',@initMoveCards,'TasksToExecute',1));
    else,
        % Move one card
        global_info.INITIAL_DEAL_MOVES = global_info.INITIAL_DEAL_MOVES + 1;
        moveTo = global_info.INITIAL_DEAL_MOVE(global_info.INITIAL_DEAL_MOVES);
        disp(moveTo);
        
        disp(strcat('Trying to move to',{' '},moveTo));
        set_handle(global_info.handles.DP_Move_Location,'String',strcat('TP',moveTo));
        global_info.DP_Move_Btn = true;
    end;
end