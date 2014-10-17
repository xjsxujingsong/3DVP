function cluster_occlusion_patterns_batch(index)

is_3d = 0;

data_file = 'data.mat';
object = load(data_file);
data = object.data;
if is_3d
    ps_3d = data.ps_3d;
else
    ps_2d = data.ps_2d;
end

% algorithm = 'kmeans';
% K = [5, 10, 20, 30, 40, 50, 100, 150, 200, 250, 300, 350];
% num = numel(K);
% idx_2d_kmeans = cell(1, num);
% idx_3d_kmeans = cell(1, num);
% 
% for i = 1:num
%     idx_2d_kmeans{i} = cluster_2d_occlusion_patterns(data, algorithm, K(i));
%     idx_3d_kmeans{i} = cluster_3d_occlusion_patterns(data, algorithm, K(i));
% end
% 
% data.K = K;
% data.idx_2d_kmeans = idx_2d_kmeans;
% data.idx_3d_kmeans = idx_3d_kmeans;
% save(data_file, 'data');


algorithm = 'ap';
% ps_3d = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4];
% ps_2d = [1.1, 1.2, 1.3, 1.4, 1.6, 1.7, 1.8, 1.9, 2, 2.1, 2.2, 2.3, 2.4, 2.5];
if is_3d
    idx_3d_ap = cluster_3d_occlusion_patterns(data, algorithm, [], ps_3d(index));
    filename = sprintf('Clusters/idx_3d_ap_%d.mat', index);
    save(filename, 'idx_3d_ap');
else
    idx_2d_ap = cluster_2d_occlusion_patterns(data, algorithm, [], ps_2d(index));
    filename = sprintf('Clusters/idx_2d_ap_%d.mat', index);
    save(filename, 'idx_2d_ap');
end