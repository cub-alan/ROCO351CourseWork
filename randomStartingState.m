function state = randomStartingState()

state = 11*randi(); % create a random integer between 1 and 11

while state == 2 % check if the state is 2
    state = 11*randi(); % while the state is 2 create a new random state
end
end