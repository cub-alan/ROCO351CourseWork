import runDynaQTrial.*
import initQ.*

[steps,qtable,model_reward,model_nextstate,visited] = runDynaQTrial();

figure; % create a new figure
x = (1:1:100); % set the x axis scale to be between 1 and 100 going up in steps of 1 
plot(x,steps); % plot the steps to their assosiated episode number

% lables the graph and put the graphs grid on 
xlabel("episode number");
ylabel("number of steps until the episode completed")
title("TASK 8: runQTrial")
grid on;

figure;
surf(qtable);
xlabel('State'); % create a label for x axis
ylabel('Action'); % create a label for y axis
zlabel('Q Value'); % create a label for z axis
title('ROCO351: DynaQ Function Table Values'); % create a title for the figure
grid on; % turn the grid on

zlim([0 1]); % set the bounds of z axis to between 0 and 1
zticks(0:0.2:1); %set the z axis to go up in 0.2 increments 
colorbar; % create a colour bar to show size of the point as a colour coded scale
colormap summer;
