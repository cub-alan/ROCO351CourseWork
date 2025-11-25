function [qtable,model_reward,model_nextstate,visited,steps] = runDynaQEpisode(qtable,model_reward,model_nextstate,visited)

import runQTrial.*
import runDynaQModel.*

n = 10; %desired num of DynaQ loops
steps = 0;

%for testing
%qtable = initQ();
%model_reward =zeros(11,4);
%model_nextstate = zeros (11,4);
%visited = zeros(11,4);

state = randomStartingState(); % set the state to the randomly generated starting state

while (state~=2) % if the state isnt the goal state loop the following states 
    
    steps = steps+1;

    action = epsilonGreedyAction(qtable,state); % get the action using the epsilon gready function
    next_state = nextState(state,action); % find the next state given the current state and action
    rewardValue = reward(state,action); % set the reward value for the current state and action
    qtable = update(qtable,state,action,next_state,rewardValue); % update the qtable to add preference to the prefered outcome or reduces prefrence if it was a bad outcome
    
    % set up the model for the DynaQ
    model_reward(state,action) = rewardValue; 
    model_nextstate(state,action) = next_state;
    visited(state,action) = 1;
    
    qtable = updateDynaQModel(qtable,model_reward,model_nextstate,visited,n);% do the DnaQ update n amount of times

    state = next_state; % set the new current state

end

%testing models and qtable
%disp(qtable);
%disp(model_nextstate);
%disp(model_reward);
%disp(visited);

end