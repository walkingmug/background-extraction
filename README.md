# Background Extraction

## Description

Extracts the background from videos with moving objects, and exports it into an image. Takes the median of every pixel value along all frames and assigns the new RGB value to the resulting pixel.

![background](https://user-images.githubusercontent.com/29484054/208263039-25ba697b-19c0-401e-9d38-ab27696bf920.gif)


[View source](https://flic.kr/p/869k7b)

## Getting Started

### Dependencies

* Developed with MATLAB R2022b.

### Executing program

1. Put the video source in the same directory as the main file. To test with the original file, [download it from here](https://flic.kr/p/869k7b).
2. Run the file 'background_extraction.m'
3. The image result is saved in the same directory.

### Changing the data
* A video other than the default one can be segmented by changing the source file:
```
% read the video
video = VideoReader('700.mp4');
```

### Help
* If the produced image is not being accurate, try reducing the frequency at which frames are taken:
```
% extract every n-th frame
frames_to_skip = 20;
```

### Limitations
* The positioning of the video system must be stable (i.e. no shaky camera).
* Any portion of the video must be at least half the time unobscured.

## Version History
* 0.1
    * Initial Release
