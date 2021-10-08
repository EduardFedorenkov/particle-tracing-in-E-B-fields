function E = E_field_creation(meshes_1d, E_val)
E = cell(1, 3);
E{1} = ones(length(meshes_1d{1}), length(meshes_1d{2}), length(meshes_1d{3})) * E_val(1);
E{2} = ones(length(meshes_1d{1}), length(meshes_1d{2}), length(meshes_1d{3})) * E_val(2);
E{3} = ones(length(meshes_1d{1}), length(meshes_1d{2}), length(meshes_1d{3})) * E_val(3);
end
