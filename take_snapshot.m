% trigger both cameras
trigger([colorCam depthCam]);

% get the acquired frames shot by each cam
imgColor = getdata(colorCam);
imgDepth = getdata(depthCam);
imgDepth = imgDepth(:, :, :);
imgDepth = imgDepth/1000.0;
imgDepth = mean(imgDepth, 3);


% xa = imgDepth(:, :);
% nozerosDepth = imgDepth(:, :);
% % removing all zeros
% [H, W] = size(imgDepth);
% for i = 1:H
%     for j = 1:W
%         if(imgDepth(i, j) == 0 && j~= W)
%             nozerosDepth(i, j) = imgDepth(i, j+1);
%         end
%         if(imgDepth(i, j) == 0 && j== W)
%             nozerosDepth(i, j) = imgDepth(i, j-1);
%         end
%     end
% end

% save data in a mat-file
save('test.mat', 'imgColor', 'imgDepth');

% stop cameras after finishing
%stop([colorCam depthCam]);