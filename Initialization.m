function [x, v] = Initialization(numberOfParticles, numberOfVariables, xMin, xMax, alpha, deltaT)
  x = zeros(numberOfParticles, numberOfVariables);
  v = zeros(numberOfParticles, numberOfVariables);
  for i = 1 : numberOfParticles
    for j = 1 : numberOfVariables
      r = rand;
      x(i, j) = xMin + r * (xMax - xMin);
      v(i, j) = alpha / deltaT * (-(xMax - xMin )/2 + r * (xMax - xMin));
    end
  end
end