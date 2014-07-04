function exemplar_dpm_train

cls = 'car';

% Main function to train exemplar DPM for occlusion patterns

% load the mean CAD model
% filename = sprintf('../Geometry/%s_mean.mat', cls);
% object = load(filename);
% cad = object.(cls);

% load occlusion patterns
filename = '../KITTI/data.mat';
object = load(filename);
data = object.data;

% cluster centers
centers = unique(data.idx);

% train an exemplar DPM for each cluster
num = numel(centers);

for i = 1:num
    fprintf('%d/%d: Train DPM for center %d\n', i, num, centers(i));
%     exemplar_show_pattern(data, cad, centers(i));
%     pause(1);
    kitti_train(cls, data, centers(i), '');
end