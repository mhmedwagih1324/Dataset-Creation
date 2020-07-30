% initialize video input
colorCam = videoinput('kinect', 1, 'BGR_1920x1080');
depthCam = videoinput('kinect', 2, 'Depth_512x424');

%src_color = getselectedsource(colorCam);
%src_depth = getselectedsource(depthCam);

% set number of frames per trigger
colorCam.FramesPerTrigger = 1;
depthCam.FramesPerTrigger = 50;

% set the trigger of each camera to run manually not immediately after
% starting it.
triggerconfig([colorCam depthCam], 'manual')

% set number of trigger repeats (default = 1), zero based number
colorCam.TriggerRepeat = 20;
depthCam.TriggerRepeat = 20;

% preview([colorCam depthCam])
% stoppreview([colorCam depthCam])

% start both cameras
start([colorCam depthCam])
