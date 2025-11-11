function UpdatedQTable = update(qtable,state,action,next_state,reward)

LearningRate = 0.2; % set the learning rate (alpha) to the desired amount of 0.2
TemporalDiscountRate = 0.9;% set the Temporal Discount Rate (gamma) to the desired amount of 0.9

UpdatedQTable = qtable; % setts up the fuction to be a qtable

UpdatedQTable(state,action) = LearningRate*(reward+TemporalDiscountRate*max(qtable(next_state,:))-qtable(state,action));
% adjusts the qtable to create the new desired updated qtable

end