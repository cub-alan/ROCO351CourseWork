function [qtable,model_reward,model_nextstate,visited] = updateDynaQModel(qtable,model_reward,model_nextstate,visited,state,action,next_state,rewardValue,n)

import runQTrial.*

%initialise the models for reward, next state and visited
model_reward(state,action) = rewardValue; 
model_nextstate(state,action) = next_state;
visited(state,action) = 1;

while state ~= 2 % loop the code while the state isnt terminal

    % get values from the previously made functions 
    action = epsilonGreedyAction(state,qtable);
    next_state = nextState(state,action);
    rewardValue = GetReward(state,action); 

    qtable = update(qtable,state,action,next_state,rewardValue); % update the qtable with the values gathered

    model_reward(state,action) = rewardValue; % put the reward into the model for that specific state action pair
    model_nextstate(state,action) = next_state; % put the next state into the model for that state action pair
    visited(state,action) = 1; % set the state and action pairs visited status to 1

    state = next_state; % set the currunt state to the state the program just moved to

for i = 1:n % for all values of i from 1 to input int n
    PrevioslyObserved = 0; % check to determine if something has already been done

    while PrevioslyObserved == 0 % loop the following if the specific action and state hasnt been seen previously
       
        RandState = randi(11); % create a random integer state between 11 and 1
        RandAction = randi(4); % create a random integer action between 4 and 1
        PrevioslyObserved = (visited(RandState,RandAction) == 1); % set the Previously seen int to if the visited model returns a one for that state action pair
   
    end

    ModelReward = model_reward(RandState,RandAction); % find the reward for the random new state and action pair
    ModelNextState = model_nextstate(RandState,RandAction); % find the outcome of the random new state action pair
    qtable(RandState,RandAction) = qtable(RandState,RandAction) + LearningRate*(ModelReward+TemporalDiscountRate*max(qtable(ModelNextState,:))-qtable(RandState,RandAction)); %update the qtable using the models
end

end

end