function E = E_field_creation(meshes_1d, E_val)
z_size = length(meshes_1d{1});
r_size = length(meshes_1d{2});
angle_size = length(meshes_1d{3});
E = cell(1, 3);
E{1} = ones(z_size, r_size, angle_size) * E_val(1);
E{2} = ones(z_size, r_size, angle_size) * E_val(2);
E{3} = ones(z_size, r_size, angle_size) * E_val(3);
end
