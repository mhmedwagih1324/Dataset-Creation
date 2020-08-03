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
- ### resize_dataset:
contains code that is responsible for resizing images added in
'part_of_dataset.mat' to be of size (Nx3x640x480) for color images and
(Nx640x480) for depth images.

### test.mat:
contains the image taken using 'Capture_Image.m', divided as a colorImage 
and a depthImage as matrices.

### part_of_dataset.mat:
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
### 'resize_dataset.m'
- load the new part of the dataset.
- load the ready dataset that was created before.
- loop on each image of the dataset and resize it and stack them onto the
old ready dataset.
- save the updated dataset in place of the old one.

-- after this step the developer should reset the mat file named 
'part_of_dataset.mat' for future uses and stop the camera.