s1 = load('dataset1.mat', 'images', 'depths');
images = s1.images;
depths = s1.depths;
s2 = load('ready_dataset.mat', 'images', 'depths');
imgs = s2.images;
dpts = s2.depths;
for i = 2:size(images, 1)
    ci = reshape(images(i, :, :, :), [1080 1920 3]);
    di = reshape(depths(i, :, :), [424 512]);
    ci = imresize(ci, [480 640]);
    di = imresize(di, [480 640]);
    ci = permute(ci, [3 2 1]);
    di = permute(di, [2 1]);
    ci = reshape(ci, [1 3 640 480]);
    di = reshape(di, [1 640 480]);
    imgs = [imgs;ci];
    dpts = [dpts;di];
end
images = imgs;
depths = dpts;
save('ready_dataset.mat', 'images', 'depths');