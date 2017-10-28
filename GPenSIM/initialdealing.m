function [] = initialdealing()
    global global_info;
    tim = timer('ExecutionMode','fixedRate','Period',0.1, 'TimerFcn',@initDeal,'TasksToExecute',10, 'BusyMode', 'queue');
    start(tim);
    %wait(tim);
end

function initDeal(obj, event)
    global global_info;
    global PN;
    
%     disp(PN.system_resources.instance_usage);
%     [playerAction] = request('tDPi_Dealer', {'playerAction', 1});
%     disp(playerAction);
%     release('tDPi_Dealer');
%     
    % Only one resource used, thus we can check directly in the internal
    % data structure of the resource.
    dp_turn_trans = get_trans('tDPi_Turn');
    if PN.system_resources.instance_usage(1,1) ~= 0 || ...
            dp_turn_trans.times_fired < global_info.initialDealTurns,
        % Token is not available, some other started action must be
        % incomplete. Wait a bit and try again.
        
        disp('Resource is in use. Wait a bit and try again.');
        %pause(2);
        start(timer('ExecutionMode','fixedRate','StartDelay',0.1, 'TimerFcn',@initDeal,'TasksToExecute',1));
        %initDeal(obj, event);
    else,
        % Move one card
        disp('Trying to turn.');
        global_info.initialDealTurns = global_info.initialDealTurns + 1;
        %release('tDPi_Dealer');
        global_info.DP_Turn_Btn = true;
    end;
end