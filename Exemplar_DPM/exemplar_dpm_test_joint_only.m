function exemplar_dpm_test_joint_only(cls)

matlabpool open;

is_continue = 0;
is_train = 1;
is_pascal = 0;


if is_pascal
    if is_train
        filename = '../PASCAL3D/data.mat';
    else
        filename = '../PASCAL3D/data_all.mat';
    end
else
    if strcmp(cls, 'car') == 1
        if is_train
            filename = '../KITTI/data.mat';
        else
            filename = '../KITTI/data_all.mat';
        end
    else
        if is_train
            filename = sprintf('../KITTI/data_%s.mat', cls);
        else
            filename = sprintf('../KITTI/data_kitti_%s.mat', cls);
        end        
    end
end

object = load(filename);
data = object.data;
data.idx = data.idx_pose;

% cluster centers
centers = unique(data.idx);
centers(centers == -1) = [];
fprintf('%d clusters\n', numel(centers));
name = sprintf('pose_%d', numel(centers));

exemplar_test_joint(cls, name, is_train, is_continue, is_pascal);

matlabpool close;