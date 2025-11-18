function steps = runQTrial()

% import the required previously writen files needed to make this run
import runEpisode.*
import initQ.*

episode = 0; % set the episode number to 0
steps = zeros(1,100); % create a zeros matrix form 1 to 100 for storing the steps
qtable = initQ(); % initialise the q table before the episodes

while episode < 100 % while less then 100 episodes have run keep looping the episodes

    episode = episode + 1; % add one to the episode counter
    [qtable,CurrentStepCount]=runEpisode(qtable); % run the episode using the qtable and retrieve the current amount of steps needed to complete that episode
    steps(episode) = CurrentStepCount; % set the current episodes step count into the step matrix

end

end