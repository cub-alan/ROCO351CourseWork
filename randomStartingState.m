function state = randomStartingState()

state = randi(1,11); % create a random integer between 1 and 11

while state == 2 % check if the state is 2
    state = randi(1,11); % while the state is 2 create a new random state
end
end