%Adds a captured image to dataset
%   This script should run immediately after 'Capture_Image.m' to add a
%   captured image saved in 'test.mat' to the dataset.mat
pass = 'wigo';
str = input('what are you doing?');
% verify before adding to dataset
if(strcmp(pass,str))
    % load the captured image
    load('test.mat', 'imgColor', 'imgDepth');
    % load the dataset mat file
    load('dataset.mat', 'images', 'depths');
    % reshape the image and depth
    imgColor = reshape(imgColor, [1, 1080, 1920, 3]);
    imgDepth = reshape(imgDepth, [1, 424, 512]);
    % stack the new image and its depth onto the dataset
    images = [images;imgColor];
    depths = [depths;imgDepth];
    % save the data set
    save('dataset.mat', 'images', 'depths');
    disp('please commit the repo!');
end