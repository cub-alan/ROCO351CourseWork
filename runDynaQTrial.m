function qtable = runDynaQTrial()

import runDynaQEpisode.*

qtable = initQ();
model_reward =zeros(11,4);
model_nextstate = zeros (11,4);
visited = zeros(11,4);

episode = 0;
steps = zeros(1,100);

while episode<100

    episode = episode+1;
    [qtable,model_reward,model_nextstate,visited,Current_step] = runDynaQEpisode(qtable,model_reward,model_nextstate,visited);
    steps(episode)= Current_step;

end

%testing models and qtable
disp(qtable);
disp(model_nextstate);
disp(model_reward);
disp(visited);
disp(steps());


end