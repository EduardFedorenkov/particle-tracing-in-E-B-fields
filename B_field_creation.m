function B = B_field_creation(meshes_1D, Bz_min, Bz_max)
B = cell(1, 3);
B{1} = zeros(length(meshes_1D{1}), length(meshes_1D{2}), length(meshes_1D{3}));
B{2} = zeros(length(meshes_1D{1}), length(meshes_1D{2}), length(meshes_1D{3}));
B{3} = zeros(length(meshes_1D{1}), length(meshes_1D{2}), length(meshes_1D{3}));
%B_1D = linspace(Bz_min, Bz_max, length(meshes_1D{3}));
for i = 1:length(meshes_1D{3})
    for j = 1:length(meshes_1D{2})
        for k =  1:length(meshes_1D{1})
            B{3}(k,j,:) = linspace(Bz_min, Bz_max, length(meshes_1D{3}));
        end
    end
end
end

