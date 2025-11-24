function [steps,qtable,model_reward,model_nextstate,visited] = runDynaQTrial(qtable,model_reward,model_nextstate,visited)

import runDynaQEpisode.*

episode = 0;
steps = zeros(1,100);

while episode<100

    episode = episode+1;
    [qtable,model_reward,model_nextstate,visited,Current_step] = runDynaQEpisode(qtable,model_reward,model_nextstate,visited);
    steps(episode)= Current_step;

end

end