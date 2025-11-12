import randomStartingState.*

x = 100000;

samples = zeros(0,x);

for i = 1:x
    samples(i) = randomStartingState();
end

figure;
histogram(samples);
xlabel('State');
ylabel('Frequency');
title('random starting state values over 100000 cycles');
grid on;

