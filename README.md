# Dataset-Creation
this repository should contain the matlab scripts that were used to create the dataset and the dataset as multiple mat files.

## Scripts inculde:
- ### Initialize_Kinect: 
contains code that Initializes both cameras(color and depth) and sets some property values like: FramesPerTrigger and TriggerRepeat.
- ### Capture_Image:
contains code that triggers both cameras to take the frames specified in the 'Initialize_Kinect.m' file, then it gets the mean of 
shots taken through the depth sensor and removes zeros from both edges of the Image.

### test.mat:
contains the first image taken using the above scripts, contains a colorImage and a depthImage as matrices.
