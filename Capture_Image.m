% this script runs after running the 'Initialize_Kinect.m' file has run,
% this script triggers both cameras to take the specified number of frames
% by the 'FramesPerTrigger' property in the 'Initialize_Kinect.m', then
% gets the mean of the depth frames and removes zeros in Depth that are on
% both edges of the depth image, then saves the image and depth.

% trigger both cameras
trigger([colorCam depthCam]);

% get the acquired frames shot by each cam
imgColor = getdata(colorCam);
imgDepth = getdata(depthCam);
imgDepth = imgDepth(:, :, :);
imgDepth = double(imgDepth)/1000;
imgDepth = mean(imgDepth, 3);

% removing all zeros from both sides of the image
[H, W] = size(imgDepth);
for i = 1:H
    for j = 1:W
        % check if the pixel = 0 and is on the left border of the image
        if(imgDepth(i, j) == 0 && j~= W)
            imgDepth(i, j) = imgDepth(i, j+1);
        end
        % check if the pixel = 0 and is on the right border of the image
        if(imgDepth(i, j) == 0 && j== W)
            imgDepth(i, j) = imgDepth(i, j-1);
        end
    end
end

% save data in a mat-file
save('test.mat', 'imgColor', 'imgDepth');

% stop cameras after finishing
%stop([colorCam depthCam]);