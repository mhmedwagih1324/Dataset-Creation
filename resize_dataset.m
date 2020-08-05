% load the new part of the dataset
s1 = load('part_of_dataset.mat', 'images', 'depths');
images = s1.images;
depths = s1.depths;
% load the old part of the dataset
s2 = load('ready_dataset.mat', 'images', 'depths');
imgs = s2.images;
dpts = s2.depths;
imgs = permute(imgs, [4 3 2 1]);
dpts = permute(dpts, [3 2 1]);
% loop on each image of the new dataset
for i = 2:size(images, 1)
    % do some operations on the image
    ci = reshape(images(i, :, :, :), [1080 1920 3]);
    di = reshape(depths(i, :, :), [424 512]);
    ci = imresize(ci, [480 640]);
    di = imresize(di, [480 640]);
    ci = permute(ci, [3 2 1]);
    di = permute(di, [2 1]);
    ci = reshape(ci, [1 3 640 480]);
    di = reshape(di, [1 640 480]);
    % stack those images onto other images in the dataset
    imgs = [imgs;ci];
    dpts = [dpts;di];
end
% update the dataset with the new added images
images = imgs;
depths = dpts;
images = permute(images, [4 3 2 1]);
depths = permute(depths, [3 2 1]);
save('ready_dataset.mat', 'images', 'depths');