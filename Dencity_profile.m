%% Particle movement area
% Cilindrical params
z_length = 150;             %[mm]
Radius = 85;               %[mm]
min_polar_angle = 0;        %[rad]
max_polar_angle = 2*pi;     %[rad]
%% Mesh params
z_grid_size = 15;
cross_grid_size = 25;
z_grid = linspace(z_length / (2 * z_grid_size),...
                  z_length * (2 * z_grid_size - 1) / (2 * z_grid_size), z_grid_size);
cross_grid = linspace(Radius * (1 - cross_grid_size) / cross_grid_size,...
                      Radius * (cross_grid_size - 1) / cross_grid_size, cross_grid_size);
meshes_1D = {cross_grid, cross_grid, z_grid};
%% Physical params
% Emiter description:
% We assum emiter has the form of sphere.
% This sphere params is 
%   1. "emiter_position" - center of the sphere position in cilindrical
%   coordinates [z, r, phi]
%   2. "emiter_radius" - radius of the sphere
emiter_position = [0, 0, 0];
emiter_radius = 10;                  %[mm]
% Particle params----------------------------------------------------------
%[charge in SGS]
%[mass in g]
H_plus_ion = struct('charge', 4.8032047126*10^(-10), 'mass', 1.6726219*10^(-24));
% Fields creation----------------------------------------------------------
Bz_min = 0.001;                                 %[T]
Bz_max = 0.005;                                 %[T]
E = [0, 0, 0];                                  %[V/cm]
B_field = B_field_creation(meshes_1D, Bz_min, Bz_max);
E_field = E_field_creation(meshes_1D, E);
%% Test. Moution equation solver
tspan = [0 66];
y0 = [100, 0, 0, 0, 250, 300];
[t, y] = ParticleTracing(meshes_1D, tspan, y0, H_plus_ion, E_field, B_field);
plot3(y(:,1),y(:,2),y(:,3));