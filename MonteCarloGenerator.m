function q = MonteCarloGenerator(particle, Energy, R)
q = zeros(1, 6);
theta = arcsin(sqrt(rand()));
phi = 2*pi*rand();

n = zeros(1, 3);
n(1) = sin(theta)*cos(phi);
n(2) = sin(theta)*cos(phi);
n(3) = cos(theta);

q(1:3) = R * n;
q(4:6) = sqrt(2 * Energy / particle.mass) * n;
end

