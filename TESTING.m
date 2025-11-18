import randomStartingState.*
import update.*
import initQ.*
import reward.*
import epsilonGreedyAction.*
import nextState.*
import runEpisode.*
import runQTrial.*

qtable = initQ()
state = randomStartingState();
action = epsilonGreedyAction(qtable, state);
next_state = nextState(state, action);
rewardValue = reward(state, action);

newQ = update(qtable,state,action,next_state,rewardValue)


