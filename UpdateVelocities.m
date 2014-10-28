function [v, inertiaWeight] = UpdateVelocities(v, x, swarmBest, particleBest, cognitiveConst, socialConst, deltaT, vMax, beta, inertiaWeight, minInertiaWeight)
  numberOfParticles = size(v, 1);
  numberOfVariables = size(v, 2);

  for i = 1 : numberOfParticles
    for j = 1 : numberOfVariables
      r = rand;
      q = rand;
      v(i, j) = inertiaWeight*v(i, j) + ...
          cognitiveConst*q*(particleBest(i, j) - x(i, j)) / deltaT + ...
          socialConst*r*(swarmBest(j) - x(i, j)) / deltaT;

      if (abs(v(i, j)) > vMax)
        v(i, j) = sign(v(i, j)) * vMax;
      end
    end
  end
  inertiaWeight = inertiaWeight * beta;
  if(inertiaWeight < minInertiaWeight)
    inertiaWeight = minInertiaWeight;
  end
end