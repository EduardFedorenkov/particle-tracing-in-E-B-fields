function vec_field = FindField(pos, field, meshes_1D)
[index, flag] = FindCellIndex(pos, meshes_1D);
vec_field = [0; 0; 0];
if flag
    for i = 1:3
        vec_field(i) = field{i}(index(1), index(2), index(3));
    end
end

end

function [index, is_into_grid] = FindCellIndex(point, meshes)
    index = zeros(1,length(meshes));
    is_into_grid = true;
    for i = 1:length(meshes)
        mesh_step = abs(meshes{i}(2) - meshes{i}(1));
        mesh_left_bound = 0;
        if meshes{i}(1) < 0
            mesh_left_bound = meshes{i}(1) - mesh_step / 2;
        end
        index(i) = ceil((point(i) - mesh_left_bound) / mesh_step);
        if index(i) < 1 || index(i) > length(meshes{i})
            is_into_grid = false;
            break;
        end
    end
end