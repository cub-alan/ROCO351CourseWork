function [qtable,model_reward,model_nextstate,visited] = updateDynaQModel(state,action,next_state,rewardValue,n)

import runQTrial.*

qtable = initQ(); % initialise the qtable

state = randomStartingState(); % generate a random begining state for the program

model_reward(state,action) = rewardValue; % this will store what the reward given was for a specific state and action
model_nextstate(state,action) = next_state; % this will store where the program ended up given a specific state and action so it can call back on it later
visited(state,action) = 1; % sets any previously seen state and action combo to 1 so that the program knows that it wont need to store the information again

while state ~= 2 % loop the code while the state isnt terminal

    action = epsilonGreedyAction(state,qtable);
    next_state = nextState(state,action);
    rewardValue = GetReward(state,action);
    qtable = update(qtable,state,action,next_state,rewardValue);

    ModelReward = model_reward(state,action); % find the reward for the state and action pair
    ModelNextState = model_nextstate(state,action);

    state = next_state;

for i = 1:n % for all values of i from 1 to input int n
    visited_check = 0; % check to determine if something has already been done

    while visited_check == 0 % loop the following if the specific action and state hasnt been completed previously
        RandState = randi(11,1); % create a random integer state between 11 and 1
        RandAction = randi(4,1); % create a random integer action between 4 and 1
        visited_check = visited(RandState,RandAction) == 1; % set the state action pairs visibility to 1 to show they have been observed
    end
    ModelReward = model_reward(RandState,RandAction); % find the reward for the random new state and action pair
    ModelNextState = model_nextstate(RandState,RandAction); % find the outcome of the random new state action pair
    qtable(RandomState,RandomAction) = qtable(RandomState,RandomAction) + LearningRate*(ModelReward+TemporalDiscountRate*max(qtable(ModelNextState,:))-qtable(RandomState,RandomAction)); %update the qtable using the models
end

end

end