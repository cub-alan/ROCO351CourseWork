function action = epsilonGreedyAction(qtable, state)

chance = rand(); % create a random number from 0 and 1

if chance < 0.9 % if the chance is in the 90%
    [~,action] = max(qtable(:,state)); % take the highest state valued row from the Q table and set it to the action
else % if the chance is in the 10% 
    action = 4*randi(); % create a random integer between 1 and 4 to set as the random north east south west value
end
end