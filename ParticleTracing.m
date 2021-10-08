function [t, new_pos] = ParticleTracing(meshes_1D, tspan, init_cond, particle, E_field, B_field)
light_speed = 3 * 10^(10);    % [cm/s]
f = @(t,y) [y(4:6); (particle.charge/particle.mass)*( FindField(y(1:3), E_field, meshes_1D)...
           + 1/(light_speed) * cross(y(4:6), FindField(y(1:3), B_field, meshes_1D)) )];
[t, new_pos] = ode45(f,tspan,init_cond');
end

