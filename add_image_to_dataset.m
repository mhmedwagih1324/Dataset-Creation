function [] = add_image_to_dataset( ~ )
%Adds a captured image to dataset
%   Detailed explanation goes here
load('test.mat', 'imgColor', 'imgDepth');
load('dataset.mat', 'images', 'depths');
imgColor = reshape(imgColor, [1, 1080, 1920, 3]);
imgDepth = reshape(imgDepth, [1, 424, 512]);
images = [images;imgColor];
depths = [depths;imgDepth];
save('dataset.mat', 'images', 'depths');
end

