function [] = add_image_to_dataset( ~ )
%Adds a captured image to dataset
%   This function should run immediately after 'Capture_Image.m' to add a
%   captured image saved in 'test.mat' to the dataset.mat
pass = 'wigo';
str = input('what are you doing?');
if(strcmp(pass,str))
    load('test.mat', 'imgColor', 'imgDepth');
    load('dataset.mat', 'images', 'depths');
    imgColor = reshape(imgColor, [1, 1080, 1920, 3]);
    imgDepth = reshape(imgDepth, [1, 424, 512]);
    images = [images;imgColor];
    depths = [depths;imgDepth];
    save('dataset.mat', 'images', 'depths');
end
end

