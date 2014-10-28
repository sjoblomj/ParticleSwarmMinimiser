clear all;

numberOfIterations = 300;
numberOfParticles  = 20;
numberOfVariables  = 2;
inertiaWeight      = 1.4;
minInertiaWeight   = 0.35;
cognitiveConst     = 2;
socialConst        = 2;
alpha  = 1;
beta   = 0.99;
deltaT = 1;
xMin   = -10;
xMax   = 10;
vMax   = (xMax - xMin) / deltaT;


% Initialization
[swarm, v] = Initialization(numberOfParticles, numberOfVariables, xMin, xMax, alpha, deltaT);
particleBest = swarm;
swarmBest    = swarm(1,:);
results = zeros(1, numberOfParticles);

for iteration = 1 : numberOfIterations
  for i = 1 : numberOfParticles
    % Evaluation
    results(i) = Evaluate(swarm(i, :));

    % Update the best positions
    if (results(i) < Evaluate(particleBest(i, :)))
      particleBest(i, :) = swarm(i, :);
    end
    if (results(i) < Evaluate(swarmBest))
      swarmBest = swarm(i, :);
    end
  end

  % Update velocities and positions
  [v, inertiaWeight] = UpdateVelocities(v, swarm, swarmBest, particleBest, cognitiveConst, socialConst, deltaT, vMax, beta, inertiaWeight, minInertiaWeight);
  swarm = UpdatePositions(swarm, v, deltaT);

  scatter(swarm(:, 1), swarm(:, 2), '+', 'k');
  axis([-60 60 -60 60])
  drawnow;
end

disp(sprintf('Swarm best: x = %g, y = %g', swarmBest(1), swarmBest(2)));
disp(sprintf('Function value: %d', Evaluate(swarmBest)));