import runQTrial.*

steps = runQTrial();

figure; % create a new figure
x = (1:1:100); % set the x axis scale to be between 1 and 100 going up in steps of 1 
plot(x,steps); % plot the steps to their assosiated episode number

% lables the graph and put the graphs grid on 
xlabel("episode number");
ylabel("number of steps until the episode completed")
title("TASK 8: runQTrial")
grid on;