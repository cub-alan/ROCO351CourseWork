function GetReward = reward(state, action)

GetReward = 0; % set the reward to 0

if (state == 5) && (action == 3) % check the state and action
    GetReward = 10; % if the state and action are 5 and 3 then set reward as 10
end

end