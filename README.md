# Dataset-Creation
this repository should contain the matlab scripts that were used to create 
the dataset and the dataset as multiple mat files.

## Scripts inculde:
- ### Initialize_Kinect: 
contains code that Initializes both cameras(color and depth) and sets some 
property values like: FramesPerTrigger and TriggerRepeat.
- ### Capture_Image:
contains code that triggers both cameras to take the frames specified in 
the 'Initialize_Kinect.m' file, then it gets the mean of shots taken 
through the depth sensor and removes zeros from both edges of the Image.
- ### add_image_to_dataset:
contains code that adds a captured image (through 'Capture_Image.m') that 
is saved to 'test.mat' to dataset saved in 'dataset.mat'.

### test.mat:
contains the first image taken using the above scripts, contains a 
colorImage and a depthImage as matrices.

### dataset.mat:
contains images and depths taken from test.mat one by one through the 
implemented mat scripts.

## Method:
### 'Initialize_Kinect.m' algorithm
- Initialize 2 video input sources(colorCam, depthCam).
- set number of frames per trigger for each cam, this determines the 
of frames taken per one trigger.
- configure both sources to be manually triggered.
- set the TriggerRebeat property of each cam, this property determines the
number of trigger requests that can be sent to each one before it 
automatically stopped.
- start both cameras.
### 'Capture_Image.m' algorithm
- trigger both cameras to take the specified number of frames for each one.
- save the taken frames to imgColor and imgDepth.
- for imgDepth-> reshape, divide by 1000(to get depth in meters), then 
get the mean of the 50 frames.
#### zeros are errors
- while testing the output of the kinect, we found that the right and left
border of each image depth is always 0, so we copied the values to their 
right and left to be the values of the borders, and done the same for any 
0 that is found on the top and bottom borders.
- for the zeros that may occur in the middle of the image, we average the
values of the neighbouring pixels.
### 'add_image_to_dataset.m' algorithm
- specify a password before adding an image to the dataset, and prompt the
user for it and compare the input with the specified password.
- load the image to be added and load the dataset.
- reshape the image and depth and stack them onto the dataset.
- save the updated dataset and tell the user to commit the change to the 
the github repository.
