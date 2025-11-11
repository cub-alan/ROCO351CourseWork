function qtable = initQ()

qtable = 0.01 + 0.09*rand(4,11); % create an 11x4 matrix of random numbers between 0.1 and 0.01

figure; % create a new figure
surf(qtable); % creates a surface plot of the values in the Q table
xlabel('State'); % create a label for x axis
ylabel('Action'); % create a label for y axis
zlabel('Q Value'); % create a label for z axis
title('ROCO351 ISH: Q Function Table Values'); % create a title for the figure
grid on; % turn the grid on

zlim([0 1]); % set the bounds of z axis to between 0 and 1
zticks(0:0.2:1); %set the z axis to go up in 0.2 increments 
colorbar; % create a colour bar to show size of the point as a colour coded scale
colormap summer;

end