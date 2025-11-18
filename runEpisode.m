function [qtable,steps] = runEpisode(qtable)

% import all of the other files into this one to be able to call on the
% previously made functions
import nextState.*
import reward.*
import randomStartingState.*
import epsilonGreedyAction.*
import update.*

state = randomStartingState(); % set the state to the randomly generated starting state
steps = 0; % set the step counter to 0
while (state~=2) % if the state isnt the goal state loop the following states 

    steps = steps+1; % add one to the counter
    action = epsilonGreedyAction(qtable,state); % get the action using the epsilon gready function
    next_state = nextState(state,action); % find the next state given the current state and action
    rewardValue = reward(state,action); % set the reward value for the current state and action
    qtable = update(qtable,state,action,next_state,rewardValue); % update the qtable to add preference to the prefered outcome or reduces prefrence if it was a bad outcome
    state = next_state; % set the new current state

end
end