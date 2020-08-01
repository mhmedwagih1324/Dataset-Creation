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
[x, y] = find(imgDepth == 0);
[H, W] = size(imgDepth);
for i = 1:size(x)
    for j = 1:size(y)
        % check if the pixel = 0 and is on the left border of the image
        if(imgDepth(x(i), y(j)) == 0 && y(j)~= W)
            imgDepth(x(i), y(j)) = imgDepth(x(i), y(j)+1);
        % check if the pixel = 0 and is on the right border of the image
        elseif(imgDepth(x(i), y(j)) == 0 && y(j)== W)
            imgDepth(x(i), y(j)) = imgDepth(x(i), y(j)-1);
        % check if the pixel = 0 and is on the top border of the image
        elseif(imgDepth(x(i), y(j)) == 0 && x(i)~= H)
            imgDepth(x(i), y(j)) = imgDepth(x(i)+1, y(j));
        % check if the pixel = 0 and is on the bottom border of the image
        elseif(imgDepth(x(i), y(j)) == 0 && x(i)== H)
            imgDepth(x(i), y(j)) = imgDepth(x(i)-1, y(j));
        % the pixel is in the middle of the matrix
        elseif(imgDepth(x(i), y(j)) == 0)
            imgDepth(x(i), y(j)) = sum(sum(imgDepth(x(i)-1:x(i)+1, y(i)-1:y(i)+1)))/8;
        end
    end
end

% save data in a mat-file
save('test.mat', 'imgColor', 'imgDepth');

% stop cameras after finishing
%stop([colorCam depthCam]);