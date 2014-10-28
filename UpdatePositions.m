function x = UpdatePositions(x, v, deltaT)
  numberOfParticles = size(x, 1);
  numberOfVariables = size(x, 2);

  for i = 1 : numberOfParticles
    for j = 1 : numberOfVariables
      x(i, j) = x(i, j) + v(i, j)*deltaT;
    end
  end
end